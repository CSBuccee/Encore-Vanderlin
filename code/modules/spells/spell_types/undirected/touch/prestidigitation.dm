/datum/action/cooldown/spell/undirected/touch/prestidigitation
	name = "Prestidigitation"
	desc = "A few basic tricks many apprentices use to practice basic manipulation of the arcyne."
	button_icon_state = "prestidigitation"
	can_cast_on_self = TRUE

	required_form = FORM_ARCANE

	cooldown_time = 10 SECONDS

	hand_path = /obj/item/melee/touch_attack/prestidigitation
	draw_message = "I prepare to perform a minor arcyne incantation."
	drop_message = "I release my minor arcyne focus."
	charges = 10

	/// Every trick this spell knows, sorted by sort_order. Built in New().
	var/list/datum/presti_trick/tricks = list()
	/// The trick the hand will perform on its next use.
	var/datum/presti_trick/current_trick

	// State that tricks keep between uses
	var/obj/effect/wisp/prestidigitation/mote
	var/spark_cd = 0
	/// Colour used by Color Spray and Sigil
	var/trick_color = "#b48cff"
	/// Weakrefs to the sigils this caster has drawn, oldest first
	var/list/datum/weakref/sigils = list()

/datum/action/cooldown/spell/undirected/touch/prestidigitation/New(Target)
	. = ..()
	for(var/datum/presti_trick/trick_type as anything in subtypesof(/datum/presti_trick))
		if(initial(trick_type.abstract_type) == trick_type)
			continue
		tricks += new trick_type()
	sortTim(tricks, GLOBAL_PROC_REF(cmp_presti_trick_order))
	current_trick = length(tricks) ? tricks[1] : null

/datum/action/cooldown/spell/undirected/touch/prestidigitation/Destroy(force)
	QDEL_NULL(mote)
	QDEL_LIST(tricks)
	current_trick = null
	sigils.Cut()
	return ..()

/// Casting creates the hand, then asks which trick to prepare.
/datum/action/cooldown/spell/undirected/touch/prestidigitation/cast(mob/living/carbon/cast_on)
	. = ..()
	if(!QDELETED(attached_hand))
		INVOKE_ASYNC(src, PROC_REF(choose_trick), cast_on)

/// Shows the trick radial menu. Closing it keeps the current trick.
/datum/action/cooldown/spell/undirected/touch/prestidigitation/proc/choose_trick(mob/living/user)
	if(QDELETED(user) || QDELETED(attached_hand))
		return

	var/list/choices = list()
	var/list/by_name = list()
	for(var/datum/presti_trick/trick as anything in tricks)
		choices[trick.name] = trick.get_radial_image()
		by_name[trick.name] = trick
	choices["Release"] = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_no")

	var/choice = show_radial_menu(user, user, choices, tooltips = TRUE, autopick_single_option = FALSE, custom_check = CALLBACK(src, PROC_REF(radial_still_valid), user))
	if(QDELETED(src) || QDELETED(user) || QDELETED(attached_hand))
		return
	if(!choice)
		if(current_trick)
			to_chat(user, span_notice("I keep my focus on [current_trick.name]."))
		return
	if(choice == "Release")
		remove_hand(user, reset_cooldown_after = TRUE)
		return

	var/datum/presti_trick/picked = by_name[choice]
	if(!picked || !picked.on_selected(src, user))
		return
	if(QDELETED(attached_hand)) // on_selected may sleep
		return
	current_trick = picked
	attached_hand.name = "prestidigitating touch ([picked.name])"
	to_chat(user, span_notice("I shape my focus for [picked.name]. [picked.desc]"))

/datum/action/cooldown/spell/undirected/touch/prestidigitation/proc/radial_still_valid(mob/living/user)
	return !QDELETED(user) && !QDELETED(attached_hand) && (attached_hand in user.held_items) && !user.incapacitated()

/datum/action/cooldown/spell/undirected/touch/prestidigitation/cast_on_hand_hit(obj/item/melee/touch_attack/hand, atom/victim, mob/living/carbon/caster, list/modifiers)
	if(!current_trick)
		return FALSE
	if(current_trick.perform(src, caster, victim))
		after_action(current_trick)
	return FALSE // never spends hand charges

/// Stamina cost and experience. Each trick scales this with its own values.
/datum/action/cooldown/spell/undirected/touch/prestidigitation/proc/after_action(datum/presti_trick/trick)
	// as skills/stats rise, fatigue drain drops, and so does the experience gained. This is a basic spell, not an endless xp fountain.
	var/fatigue_used = get_adjusted_cost() * trick.fatigue_mult
	owner.adjust_stamina(fatigue_used + trick.extra_fatigue) // extra fatigue is not counted for experience

	if(GET_MOB_SKILL_VALUE(owner, associated_skill) >= SKILL_LEVEL_EXPERT)
		return // experience from this cantrip is hard-capped at Expert
	if(fatigue_used > 0)
		adjust_experience(owner, associated_skill, fatigue_used)

/// Old-scale (0-6) skill value, used by several tricks for speed scaling.
/datum/action/cooldown/spell/undirected/touch/prestidigitation/proc/old_skill()
	return GET_MOB_SKILL_VALUE_OLD(owner, associated_skill)

/// Stops a particle holder emitting new particles so the existing ones fade out.
/proc/presti_stop_spawning(obj/effect/abstract/particle_holder/holder)
	if(QDELETED(holder) || !holder.particles)
		return
	holder.particles.spawning = 0

/proc/cmp_presti_trick_order(datum/presti_trick/a, datum/presti_trick/b)
	return a.sort_order - b.sort_order

// =====================================================================
// THE HAND
// =====================================================================

/obj/item/melee/touch_attack/prestidigitation
	name = "\improper prestidigitating touch"
	desc = "A minor arcyne focus. Use it in hand to choose a different trick, or to release it."
	color = "#3FBAFD"
	possible_item_intents = list(/datum/intent/prestidigitation)

/obj/item/melee/touch_attack/prestidigitation/attack_self(mob/user, list/modifiers)
	var/datum/action/cooldown/spell/undirected/touch/prestidigitation/spell = spell_which_made_us?.resolve()
	if(!istype(spell))
		return ..()
	INVOKE_ASYNC(spell, TYPE_PROC_REF(/datum/action/cooldown/spell/undirected/touch/prestidigitation, choose_trick), user)

/obj/item/melee/touch_attack/prestidigitation/examine(mob/user)
	. = ..()
	var/datum/action/cooldown/spell/undirected/touch/prestidigitation/spell = spell_which_made_us?.resolve()
	if(!istype(spell))
		return
	. += span_info("Prepared trick: <b>[spell.current_trick?.name]</b>.")
	for(var/datum/presti_trick/trick as anything in spell.tricks)
		. += span_info("<b>[trick.name]</b>: [trick.desc]")

/datum/intent/prestidigitation
	name = "use"
	icon_state = "inuse"
	reach = 3
	noaa = TRUE
	misscost = 0
	releasedrain = 0
	candodge = TRUE
	canparry = TRUE

// =====================================================================
// TRICK DATUM
// To add a trick: make a subtype, set name/desc/icon, override perform().
// The spell picks up every non-abstract subtype automatically.
// =====================================================================

/datum/presti_trick
	abstract_type = /datum/presti_trick
	var/name = "trick"
	var/desc = ""
	/// If set, the radial button uses this atom type's icon and icon_state.
	var/atom/radial_atom
	/// Otherwise the radial button uses this icon and state.
	var/radial_icon = 'icons/mob/actions/roguespells.dmi'
	var/radial_icon_state = "prestidigitation"
	/// Optional tint for the radial button
	var/radial_color
	/// Position in the radial menu, lowest first
	var/sort_order = 100
	/// Multiplier on the spell's base fatigue (this also drives experience)
	var/fatigue_mult = 1
	/// Flat extra stamina on top, which gives no experience
	var/extra_fatigue = 0
	/// Cached radial image
	var/image/radial_image

/datum/presti_trick/Destroy(force)
	radial_image = null
	return ..()

/datum/presti_trick/proc/get_radial_image()
	if(radial_image)
		return radial_image
	if(radial_atom)
		radial_image = image(icon = initial(radial_atom.icon), icon_state = initial(radial_atom.icon_state))
	else
		radial_image = image(icon = radial_icon, icon_state = radial_icon_state)
	if(radial_color)
		radial_image.color = radial_color
	return radial_image

/// Called when picked from the radial. May sleep. Return FALSE to cancel the pick.
/datum/presti_trick/proc/on_selected(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/user)
	return TRUE

/// Do the trick. Return TRUE on success (costs stamina, gives experience).
/datum/presti_trick/proc/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	return FALSE

// ---------------------------------------------------------------------
// CLEAN
// ---------------------------------------------------------------------
/datum/presti_trick/clean
	name = "Clean"
	desc = "Scrub an object, person or floor clean, like soap. The Apprentice's Woe."
	radial_atom = /obj/item/soap
	sort_order = 1
	fatigue_mult = 0.2 // going to be spammed a lot

/datum/presti_trick/clean/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	// adjusted from /obj/item/soap, some duplication unfortunately (needed for flavor)
	var/cleanspeed = 3.5 SECONDS - (spell.old_skill() * 3) // from 35 down to 17 deciseconds

	if(istype(target, /obj/effect/decal/cleanable))
		caster.visible_message(
			span_notice("[caster] gestures at \the [target.name], arcyne power slowly scouring it away..."),
			span_notice("I begin to scour \the [target.name] away with my arcyne power..."),
		)
		if(do_after(caster, cleanspeed, target))
			to_chat(caster, span_notice("I expunge \the [target.name] with my mana."))
			target.wash(CLEAN_WASH)
			return TRUE
		return FALSE

	caster.visible_message(
		span_notice("[caster] gestures at \the [target.name], tiny motes of arcyne power surging over [target.p_them()]..."),
		span_notice("I begin to clean \the [target.name] with my arcyne power..."),
	)
	if(do_after(caster, cleanspeed, target))
		to_chat(caster, span_notice("I render \the [target.name] clean."))
		for(var/obj/effect/decal/cleanable/C in target)
			C.wash(CLEAN_WASH)
		for(var/obj/effect/decal/presti_sigil/S in target)
			qdel(S)
		target.wash(CLEAN_WASH)
		return TRUE
	return FALSE

// ---------------------------------------------------------------------
// GATHER
// ---------------------------------------------------------------------
/datum/presti_trick/gather
	name = "Gather"
	desc = "Gather magical materials. Mould a handful of lava into obsidian."
	radial_atom = /obj/item/natural/obsidian
	sort_order = 2

/datum/presti_trick/gather/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	if(!istype(target, /turf/open/lava))
		to_chat(caster, span_warning("There is nothing here for me to gather."))
		return FALSE
	var/gatherspeed = 3.5 SECONDS - (spell.old_skill() * 3)
	if(!do_after(caster, gatherspeed, target))
		return FALSE
	to_chat(caster, span_notice("I mold a handful of oozing lava with my arcyne power, rapidly hardening it!"))
	new /obj/item/natural/obsidian(caster.loc)
	return TRUE

// ---------------------------------------------------------------------
// SPARK
// ---------------------------------------------------------------------
/datum/presti_trick/spark
	name = "Spark"
	desc = "Snap forth a spark in front of you to light torches, lanterns, campfires and other flammable things."
	radial_atom = /obj/item/flint
	sort_order = 3
	extra_fatigue = 5
	var/sparkspeed = 3 SECONDS

/datum/presti_trick/spark/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	// adjusted from /obj/item/flint
	if(world.time < spell.spark_cd + sparkspeed)
		return FALSE
	spell.spark_cd = world.time
	playsound(caster, 'sound/foley/finger-snap.ogg', 100, FALSE)
	caster.visible_message(span_notice("[caster] snaps [caster.p_their()] fingers, producing a spark!"), span_notice("I will forth a tiny spark with a snap of my fingers."))
	caster.flash_fullscreen("whiteflash")
	var/datum/effect_system/spark_spread/S = new()
	S.set_up(1, 1, get_step(caster, caster.dir))
	S.start()
	return TRUE

// ---------------------------------------------------------------------
// MOTE
// ---------------------------------------------------------------------
/datum/presti_trick/mote
	name = "Mote"
	desc = "Conjure an orbiting mote of magelight to light your way. Use again to put it out."
	radial_atom = /obj/effect/wisp/prestidigitation
	sort_order = 5
	extra_fatigue = 15

/datum/presti_trick/mote/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	// adjusted from /obj/item/wisp_lantern & /obj/item/wisp
	if(spell.mote)
		caster.visible_message(
			span_notice("[caster] wills \the [spell.mote.name] back into [caster.p_their()] hand and closes it, extinguishing its light."),
			span_notice("I will \the [spell.mote.name] back into my palm and close it."),
		)
		QDEL_NULL(spell.mote)
		return FALSE

	caster.visible_message(
		span_notice("[caster] holds open the palm of [caster.p_their()] hand and concentrates..."),
		span_notice("I hold open the palm of my hand and concentrate on my arcyne power..."),
	)
	if(!do_after(caster, 2 SECONDS, caster))
		return FALSE
	if(spell.mote) // made one while we waited
		return FALSE

	var/mote_power = clamp(4 + (spell.old_skill() - 3), 4, 7) // +1 range per step above Journeyman
	spell.mote = new
	spell.mote.set_light_range(new_outer_range = mote_power)

	var/list/icon_dimensions = get_icon_dimensions(caster.icon)
	var/orbitsize = (icon_dimensions["width"] + icon_dimensions["height"]) * 0.5
	orbitsize -= (orbitsize/world.icon_size)*(world.icon_size*0.25)
	spell.mote.orbit(caster, orbitsize, rand(0, 1), 80, 36, TRUE)
	return TRUE

/obj/effect/wisp/prestidigitation
	name = "minor magelight mote"
	desc = "A tiny display of arcyne power used to illuminate."
	icon = 'icons/roguetown/items/lighting.dmi'
	icon_state = "wisp"
	light_outer_range = 4
	light_color = "#3FBAFD"
	light_system = MOVABLE_LIGHT

// ---------------------------------------------------------------------
// SNUFF - the opposite of Spark
// ---------------------------------------------------------------------
/datum/presti_trick/snuff
	name = "Snuff"
	desc = "Pinch the air to put out a torch, lantern, candle, campfire or small fire within reach. Only smothers a little of the flames on a burning person."
	radial_atom = /obj/item/candle
	sort_order = 4
	extra_fatigue = 5
	/// Fire stacks removed from a burning creature per use
	var/fire_stacks_removed = 2

/datum/presti_trick/snuff/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	if(isliving(target))
		var/mob/living/L = target
		if(!L.on_fire)
			to_chat(caster, span_warning("[L] is not burning."))
			return FALSE
		L.adjust_fire_stacks(-fire_stacks_removed) // extinguishes by itself at 0 stacks, and leaves divine fire alone
		caster.visible_message(span_notice("[caster] pinches the air, and the flames on [L] gutter and shrink."), span_notice("I pinch the air and smother some of the flames on [L]."))
		return TRUE

	var/turf/T = get_turf(target)
	var/before = burn_state(target, T)
	target.extinguish()
	if(T)
		for(var/obj/effect/hotspot/H in T)
			if(H != target && !QDELETED(H))
				H.extinguish()
	// Only count it if a flame actually went out, so this can't be spammed on a wall for experience
	if(!QDELETED(target) && burn_state(target, T) == before)
		to_chat(caster, span_warning("I find no flame on \the [target] that will yield to me."))
		return FALSE
	playsound(T, 'sound/items/firesnuff.ogg', 50, FALSE)
	caster.visible_message(span_notice("[caster] pinches the air, and the flame dies with a wisp of smoke."), span_notice("I pinch the air, smothering the flame."))
	return TRUE

/// A snapshot of everything extinguish() can change, to tell whether it did anything.
/datum/presti_trick/snuff/proc/burn_state(atom/target, turf/T)
	var/on_fire = FALSE
	if(isobj(target))
		var/obj/O = target
		on_fire = !!(O.resistance_flags & ON_FIRE)
	var/hotspots = 0
	if(T)
		for(var/obj/effect/hotspot/H in T)
			hotspots++
	return "[on_fire]|[target.light_on]|[target.light_outer_range]|[hotspots]"

// ---------------------------------------------------------------------
// WARM - heats a container's contents, capped well below cooking heat
// ---------------------------------------------------------------------
/datum/presti_trick/warm
	name = "Warm"
	desc = "Gently warm the contents of a cup, bottle or pot. It will never get hotter than a warm bath."
	radial_atom = /obj/item/reagent_containers/glass/cup
	sort_order = 6
	fatigue_mult = 0.5
	/// Degrees added per use
	var/heat_per_use = 5
	/// Hard cap. Liquids start at 300 K and the lowest heated cooking pot recipe needs 320 K,
	/// so this must stay below 320 or it replaces a cookfire. Check it if you add a low-heat recipe.
	var/max_temp = 315

/datum/presti_trick/warm/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	if(!istype(target, /obj/item/reagent_containers) || !target.reagents?.total_volume)
		to_chat(caster, span_warning("There is nothing in \the [target] for me to warm."))
		return FALSE
	var/datum/reagents/R = target.reagents
	if(R.chem_temp >= max_temp)
		to_chat(caster, span_warning("\The [target] is as warm as I can make it."))
		return FALSE
	if(!do_after(caster, 1 SECONDS, target))
		return FALSE
	R.set_temperature(min(R.chem_temp + heat_per_use, max_temp))
	caster.visible_message(span_notice("[caster] cups a hand around \the [target], and a wisp of steam curls up."), span_notice("I coax a little warmth into \the [target]."))
	return TRUE

// ---------------------------------------------------------------------
// CHILL - the opposite of Warm
// ---------------------------------------------------------------------
/datum/presti_trick/chill
	name = "Chill"
	desc = "Draw the warmth out of a cup, bottle or pot. It cannot cool anything already hot, nor freeze it."
	radial_atom = /obj/item/reagent_containers/glass/cup
	radial_color = "#9fd8ff"
	sort_order = 7
	fatigue_mult = 0.5
	/// Degrees removed per use
	var/cool_per_use = 5
	/// Will not chill below this (about 5 C)
	var/min_temp = 278
	/// Will not touch anything hotter than this, so it can't be used to quench a brew or a crucible of molten metal
	var/max_start_temp = 330

/datum/presti_trick/chill/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	if(!istype(target, /obj/item/reagent_containers) || !target.reagents?.total_volume)
		to_chat(caster, span_warning("There is nothing in \the [target] for me to chill."))
		return FALSE
	var/datum/reagents/R = target.reagents
	if(R.chem_temp > max_start_temp)
		to_chat(caster, span_warning("\The [target] is far too hot for so small a trick."))
		return FALSE
	if(R.chem_temp <= min_temp)
		to_chat(caster, span_warning("\The [target] is as cold as I can make it."))
		return FALSE
	if(!do_after(caster, 1 SECONDS, target))
		return FALSE
	R.set_temperature(max(R.chem_temp - cool_per_use, min_temp))
	caster.visible_message(span_notice("[caster] passes a hand over \the [target], and a faint frost beads on its side."), span_notice("I draw the warmth out of \the [target]."))
	return TRUE

// ---------------------------------------------------------------------
// SEASON - adds a flavour to food. Taste only: no nutrition, no fare quality.
// ---------------------------------------------------------------------
/datum/presti_trick/season
	name = "Season"
	desc = "Sprinkle a phantom pinch of flavour over a piece of food. It changes only the taste. Choose the flavour when you prepare this trick."
	sort_order = 8
	fatigue_mult = 0 // cosmetic, gives no experience
	extra_fatigue = 2
	/// Flavours the caster can pick from. Fixed list, so nobody types something nasty into a taste message.
	var/static/list/flavours = list("salt", "pepper", "herbs", "honey", "smoke", "garlic", "butter", "spice", "mint", "cinnamon")
	var/flavour = "salt"
	/// How strong one pinch is, before the taste mix is normalised
	var/pinch = 0.25
	/// A flavour already this strong can't be added again
	var/max_share = 0.5

/datum/presti_trick/season/get_radial_image()
	if(!radial_image)
		radial_image = image(icon = 'icons/roguetown/items/cooking.dmi', icon_state = "cup_iron")
		radial_image.color = "#d9b36c"
	return radial_image

/datum/presti_trick/season/on_selected(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/user)
	var/picked = tgui_input_list(user, "Which flavour will you conjure?", "Season", flavours, flavour)
	if(picked)
		flavour = picked
	return TRUE

/datum/presti_trick/season/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	if(!istype(target, /obj/item/reagent_containers/food/snacks) || !target.reagents)
		to_chat(caster, span_warning("I can only season food."))
		return FALSE
	var/list/datum/reagent/consumable/nutriment/nutriments = list()
	for(var/datum/reagent/consumable/nutriment/N in target.reagents.reagent_list)
		nutriments += N
	if(!length(nutriments))
		to_chat(caster, span_warning("There is nothing left of \the [target] to season."))
		return FALSE
	var/datum/reagent/consumable/nutriment/first = nutriments[1]
	var/list/first_tastes = islist(first.data) ? first.data["tastes"] : null
	if(islist(first_tastes) && first_tastes[flavour] >= max_share)
		to_chat(caster, span_warning("\The [target] already tastes of [flavour]."))
		return FALSE

	for(var/datum/reagent/consumable/nutriment/N as anything in nutriments)
		if(!islist(N.data))
			N.data = list()
		var/list/old_tastes = N.data["tastes"]
		var/list/tastes = islist(old_tastes) ? old_tastes.Copy() : list()
		tastes[flavour] += pinch
		counterlist_normalise(tastes)
		N.data["tastes"] = tastes

	// carry the flavour into slices and anything this is cooked into
	var/obj/item/reagent_containers/food/snacks/snack = target
	LAZYINITLIST(snack.tastes)
	snack.tastes[flavour] = max(snack.tastes[flavour], 1)

	caster.visible_message(span_notice("[caster] rubs [caster.p_their()] fingers together over \the [target], and a faint glitter falls onto it."), span_notice("I sprinkle a pinch of [flavour] over \the [target]."))
	return TRUE

// ---------------------------------------------------------------------
// BECKON - pull a tiny loose item into your hand
// ---------------------------------------------------------------------
/datum/presti_trick/beckon
	name = "Beckon"
	desc = "Crook a finger to draw a tiny, loose object within reach into your free hand. It won't move coins, nor anything held, worn or stored."
	radial_atom = /obj/item/flint
	radial_color = "#a0f0c0"
	sort_order = 9
	fatigue_mult = 0.5
	extra_fatigue = 3

/datum/presti_trick/beckon/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	if(!can_beckon(caster, target))
		return FALSE
	var/obj/item/I = target
	if(!do_after(caster, 1 SECONDS, I))
		return FALSE
	if(!can_beckon(caster, I, feedback = FALSE)) // it may have been picked up or moved meanwhile
		return FALSE
	I.forceMove(get_turf(caster))
	caster.put_in_hands(I)
	caster.visible_message(span_notice("[caster] crooks a finger, and \the [I] skitters across to [caster.p_them()]."), span_notice("I crook a finger and \the [I] comes to me."))
	return TRUE

/datum/presti_trick/beckon/proc/can_beckon(mob/living/caster, atom/target, feedback = TRUE)
	if(!isitem(target))
		if(feedback)
			to_chat(caster, span_warning("I can only beckon small objects."))
		return FALSE
	var/obj/item/I = target
	if(QDELETED(I) || !isturf(I.loc))
		if(feedback)
			to_chat(caster, span_warning("\The [I] has to be lying loose for me to beckon it."))
		return FALSE
	if(I.anchored || (I.item_flags & ABSTRACT) || I.w_class > WEIGHT_CLASS_TINY || istype(I, /obj/item/coin))
		if(feedback)
			to_chat(caster, span_warning("\The [I] will not answer so slight a summons."))
		return FALSE
	if(get_dist(caster, I) <= 1)
		if(feedback)
			to_chat(caster, span_warning("\The [I] is close enough to simply pick up."))
		return FALSE
	return TRUE

// ---------------------------------------------------------------------
// WHISPER - send a short private message to someone within reach
// ---------------------------------------------------------------------
/datum/presti_trick/whisper
	name = "Whisper"
	desc = "Touch the air toward someone within reach and send them a few words only they can hear."
	sort_order = 10
	fatigue_mult = 0 // social, gives no experience
	extra_fatigue = 3
	var/max_length = 120
	var/cooldown = 10 SECONDS
	COOLDOWN_DECLARE(whisper_cd)

/datum/presti_trick/whisper/get_radial_image()
	if(!radial_image)
		radial_image = image(icon = 'icons/mob/actions/roguespells.dmi', icon_state = "prestidigitation")
		radial_image.color = "#c8c8ff"
	return radial_image

/datum/presti_trick/whisper/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	if(!isliving(target) || target == caster)
		to_chat(caster, span_warning("I need someone to whisper to."))
		return FALSE
	if(!COOLDOWN_FINISHED(src, whisper_cd))
		to_chat(caster, span_warning("My last whisper still lingers in the air."))
		return FALSE
	var/mob/living/L = target
	var/msg = tgui_input_text(caster, "What do you whisper to [L]?", "Whisper", max_length = max_length)
	if(!msg || QDELETED(L) || QDELETED(caster))
		return FALSE
	if(CHAT_FILTER_CHECK(msg))
		to_chat(caster, span_warning("The words die on my lips."))
		return FALSE
	if(get_dist(caster, L) > 7 || !(L in view(caster)))
		to_chat(caster, span_warning("I've lost sight of [L]."))
		return FALSE
	COOLDOWN_START(src, whisper_cd, cooldown)
	log_directed_talk(caster, L, msg, LOG_WHISPER, "prestidigitation whisper")
	to_chat(caster, span_notice("I send my words to [L] on a thread of arcyne breath: <i>\"[msg]\"</i>"))
	if(L.stat < UNCONSCIOUS && !HAS_TRAIT(L, TRAIT_DEAF))
		to_chat(L, span_hear("A faint voice whispers right beside my ear: <i>\"[msg]\"</i>"))
	return TRUE

// ---------------------------------------------------------------------
// SIGIL - draw a small glowing mark on the floor that fades with time
// ---------------------------------------------------------------------
/datum/presti_trick/sigil
	name = "Sigil"
	desc = "Trace a small glowing mark onto the floor. It fades after a while, and I can only keep a few alight at once. Choose its colour when you prepare this trick."
	sort_order = 11
	fatigue_mult = 0 // cosmetic, gives no experience
	extra_fatigue = 3
	/// How many sigils one caster can keep at once. Drawing more removes the oldest.
	var/max_sigils = 3
	var/lifetime = 5 MINUTES

/datum/presti_trick/sigil/get_radial_image()
	if(!radial_image)
		radial_image = image(icon = 'icons/obj/rune.dmi', icon_state = "1")
		radial_image.color = "#b48cff"
	return radial_image

/datum/presti_trick/sigil/on_selected(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/user)
	var/picked = tgui_color_picker(user, "Choose the colour of your sigil.", "Sigil", spell.trick_color)
	if(picked)
		spell.trick_color = picked
	return TRUE

/datum/presti_trick/sigil/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	var/turf/open/T = get_turf(target)
	if(!istype(T) || isgroundlessturf(T))
		to_chat(caster, span_warning("I need solid ground to trace a sigil on."))
		return FALSE
	if(locate(/obj/effect/decal/presti_sigil) in T)
		to_chat(caster, span_warning("There is already a sigil there."))
		return FALSE
	if(!do_after(caster, 1.5 SECONDS, T))
		return FALSE

	// forget sigils that are already gone, then retire the oldest if we're at the limit
	for(var/datum/weakref/ref as anything in spell.sigils.Copy())
		if(!ref.resolve())
			spell.sigils -= ref
	while(length(spell.sigils) >= max_sigils)
		var/datum/weakref/oldest = spell.sigils[1]
		spell.sigils.Cut(1, 2)
		qdel(oldest.resolve())

	var/obj/effect/decal/presti_sigil/S = new(T, spell.trick_color, lifetime)
	spell.sigils += WEAKREF(S)
	caster.visible_message(span_notice("[caster] traces a shape in the air, and a glowing sigil blooms on the ground."), span_notice("I trace a sigil onto the ground."))
	return TRUE

/// Purely decorative. Not a /cleanable, so it can't be farmed for cleaning quests; the Clean trick still wipes it.
/obj/effect/decal/presti_sigil
	name = "glowing sigil"
	desc = "A small mark of arcyne light. It looks harmless, and is already beginning to fade."
	icon = 'icons/obj/rune.dmi'
	icon_state = "1"
	layer = SIGIL_LAYER
	alpha = 200
	light_outer_range = 1.5
	light_power = 0.6

/obj/effect/decal/presti_sigil/Initialize(mapload, sigil_color, lifetime = 5 MINUTES)
	. = ..()
	icon_state = pick("1", "2", "3", "4", "5", "6", "7")
	if(sigil_color)
		color = sigil_color
	set_light(l_outer_range = light_outer_range, l_power = light_power, l_color = color)
	QDEL_IN(src, lifetime)

/obj/effect/decal/presti_sigil/wash(clean_types)
	. = ..()
	qdel(src)
	return TRUE

// ---------------------------------------------------------------------
// COLOR SPRAY - cosmetic burst in a colour of your choosing
// ---------------------------------------------------------------------
/datum/presti_trick/color_spray
	name = "Color Spray"
	desc = "Release a harmless spray of coloured light over anything within reach, or over yourself. Choose the colour when you prepare this trick."
	radial_color = "#e98bd8"
	sort_order = 12
	fatigue_mult = 0 // cosmetic, gives no experience
	extra_fatigue = 3
	var/cooldown = 5 SECONDS
	COOLDOWN_DECLARE(spray_cd)

/datum/presti_trick/color_spray/on_selected(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/user)
	var/picked = tgui_color_picker(user, "Choose the colour of your spray.", "Color Spray", spell.trick_color)
	if(picked)
		spell.trick_color = picked
	return TRUE

/datum/presti_trick/color_spray/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	if(!COOLDOWN_FINISHED(src, spray_cd))
		return FALSE
	COOLDOWN_START(src, spray_cd, cooldown)
	// bursts wherever the hand was aimed, within its reach
	var/turf/T = get_turf(target) || get_turf(caster)
	playsound(T, 'sound/magic/presti_fizz.ogg', 60, TRUE)
	var/obj/effect/abstract/particle_holder/holder = new(T, /particles/presti_spray, NONE, 2 SECONDS)
	holder.particles.color = spell.trick_color
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(presti_stop_spawning), holder), 0.5 SECONDS) // short burst, then let it fade
	if(T == get_turf(caster))
		caster.visible_message(span_notice("[caster] fans [caster.p_their()] fingers, and a spray of shimmering colour bursts out!"), span_notice("I release a spray of coloured light."))
	else
		caster.visible_message(span_notice("[caster] flicks [caster.p_their()] fingers toward \the [target], and a spray of shimmering colour bursts over it!"), span_notice("I flick a spray of coloured light over \the [target]."))
	return TRUE

/particles/presti_spray
	icon = 'icons/effects/particles/particle.dmi'
	icon_state = list("spark" = 2, "dot" = 3)
	width = 160
	height = 160
	count = 40
	spawning = 20
	lifespan = generator("num", 8, 14)
	fade = 6
	velocity = generator("circle", 3, 6)
	friction = 0.25
	scale = generator("num", 0.5, 1)

// ---------------------------------------------------------------------
// FIREWORKS - a burst of light over your head
// ---------------------------------------------------------------------
/datum/presti_trick/fireworks
	name = "Fireworks"
	desc = "Toss a pinch of arcyne power into the air, where it bursts into a crackling shower of light."
	radial_color = "#ffe066"
	sort_order = 13
	fatigue_mult = 0 // cosmetic, gives no experience
	extra_fatigue = 8
	var/cooldown = 10 SECONDS
	COOLDOWN_DECLARE(firework_cd)

/datum/presti_trick/fireworks/perform(datum/action/cooldown/spell/undirected/touch/prestidigitation/spell, mob/living/caster, atom/target)
	if(!COOLDOWN_FINISHED(src, firework_cd))
		return FALSE
	COOLDOWN_START(src, firework_cd, cooldown)
	var/turf/T = get_turf(caster)
	playsound(T, 'sound/magic/presti_firework.ogg', 80, TRUE)
	var/obj/effect/abstract/particle_holder/holder = new(T, /particles/presti_fireworks, NONE, 3 SECONDS)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(presti_stop_spawning), holder), 1) // a single burst
	caster.visible_message(span_notice("[caster] flicks a mote of light skyward, and it bursts into a crackling shower of colour!"), span_notice("I flick a mote skyward and it bursts into fireworks."))
	return TRUE

/particles/presti_fireworks
	icon = 'icons/effects/particles/particle.dmi'
	icon_state = list("spark" = 3, "cross" = 1, "dot" = 2)
	width = 192
	height = 256
	count = 60
	spawning = 60 // one big burst
	position = list(0, 40, 0) // above the caster's head
	lifespan = generator("num", 14, 22)
	fade = 10
	velocity = generator("circle", 4, 7)
	gravity = list(0, -0.3)
	friction = 0.15
	color = generator("color", "#ff4d4d", "#4dd2ff", UNIFORM_RAND)
	scale = generator("num", 0.6, 1.1)
