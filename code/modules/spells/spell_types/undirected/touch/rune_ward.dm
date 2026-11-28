/datum/intent/hand
	name = "hand"
	icon_state = "inuse"
	no_attack = TRUE
	candodge = FALSE
	canparry = FALSE
	noaa = TRUE

/datum/intent/hand/clean
	name = "clean"
	icon_state = "inclean"

/datum/intent/hand/draw
	name = "draw"
	icon_state = "cast"

/datum/action/cooldown/spell/undirected/touch/rune_ward
	button_icon = 'icons/mob/actions/spells/mage_utilities.dmi'
	name = "Rune Ward"
	desc = "Channel arcyne energy through ash to inscribe protective runes upon the ground. The runes trigger when trespassers cross them - but can be circumvented by jumping or flying over them. Includes the following modes:\n \
	Draw<: Draw a rune on the ground using ash from your off-hand. Choose from Stun, Fire, Chill, Damage, or Alarm types.\n \
	Clean: Scrub an existing rune from the ground. Skilled mages can do this silently.\n \
	Use: Memorize or forget allies - memorized people will not trigger your runes."

	button_icon_state = "rune_ward"

	draw_message = span_notice("I focus my arcyne power into my fingertips, ready to inscribe.")
	drop_message = span_notice("I release my arcyne focus.")

	hand_path = /obj/item/melee/touch_attack/rune_ward
	can_cast_on_self = TRUE
	infinite_use = TRUE

	spell_cost = 25

	spell_impact_intensity = SPELL_IMPACT_NONE

	required_form = FORM_ARCANE

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC | SPELL_REQUIRES_HUMAN | SPELL_REQUIRES_SAME_Z

	cooldown_time = 30 SECONDS

	var/list/allowed_names = list()
	var/list/obj/structure/rune_ward/active_runes = list()
	var/max_runes = 10

	var/draw_time = 4 SECONDS
	var/scrub_time_skilled = 3 SECONDS
	var/scrub_time_unskilled = 8 SECONDS

/datum/action/cooldown/spell/undirected/touch/rune_ward/Destroy()
	for(var/obj/structure/rune_ward/rune in active_runes)
		UnregisterSignal(rune, COMSIG_QDELETING)
	active_runes.Cut()
	return ..()

/datum/action/cooldown/spell/undirected/touch/rune_ward/proc/on_rune_destroyed(obj/structure/rune_ward/source)
	SIGNAL_HANDLER
	active_runes -= source

/datum/action/cooldown/spell/undirected/touch/rune_ward/cast_on_hand_hit(obj/item/melee/touch_attack/hand, atom/victim, mob/living/carbon/caster, list/modifiers)
	switch(caster.used_intent.type)
		if(/datum/intent/hand/draw)
			return draw_rune(hand, victim, caster)
		if(/datum/intent/hand/clean)
			return scrub_rune(hand, victim, caster)
		if(/datum/intent/use)
			return toggle_ally(victim, caster)
	return FALSE

/// Memorizes or forgets a person so they will not trigger runes drawn with this spell.
/datum/action/cooldown/spell/undirected/touch/rune_ward/proc/toggle_ally(atom/victim, mob/living/carbon/caster)
	if(!ishuman(victim) || victim == caster)
		to_chat(caster, span_warning("I can only attune my wards to another person."))
		return FALSE

	var/mob/living/carbon/human/target = victim
	var/target_name = target.real_name
	if(!target_name)
		return FALSE

	if(target_name in allowed_names)
		allowed_names -= target_name
		to_chat(caster, span_notice("I let [target_name]'s essence slip from my memory. My wards will no longer spare them."))
	else
		allowed_names += target_name
		to_chat(caster, span_notice("I commit [target_name]'s essence to memory. My wards will let them pass."))
	return FALSE

/// Returns TRUE if the given mob has been memorized as an ally by this spell.
/datum/action/cooldown/spell/undirected/touch/rune_ward/proc/is_ally(mob/living/target)
	return target?.real_name && (target.real_name in allowed_names)

/datum/action/cooldown/spell/undirected/touch/rune_ward/proc/draw_rune(obj/item/melee/touch_attack/hand, atom/victim, mob/living/carbon/caster)
	var/turf/target_turf = get_turf(victim)
	if(!target_turf)
		to_chat(caster, span_warning("There is nowhere to draw a rune here."))
		return FALSE

	if(!caster.Adjacent(target_turf))
		to_chat(caster, span_warning("I need to be adjacent to the surface."))
		return FALSE

	var/list/choices = list()
	choices["Stun"] = image(icon = 'icons/misc/rune_wards.dmi', icon_state = "rune_stun")
	choices["Fire"] = image(icon = 'icons/misc/rune_wards.dmi', icon_state = "rune_fire")
	choices["Chill"] = image(icon = 'icons/misc/rune_wards.dmi', icon_state = "rune_chill")
	choices["Damage"] = image(icon = 'icons/misc/rune_wards.dmi', icon_state = "rune_damage")
	choices["Alarm"] = image(icon = 'icons/misc/rune_wards.dmi', icon_state = "rune_alarm")

	var/choice = show_radial_menu(caster, caster, choices)
	if(!choice)
		return FALSE

	var/adjusted_time = draw_time
	var/skill_level = GET_MOB_SKILL_VALUE(caster, associated_skill)
	if(skill_level >= SKILL_LEVEL_EXPERT)
		adjusted_time *= 0.5
	else if(skill_level >= SKILL_LEVEL_JOURNEYMAN)
		adjusted_time *= 0.75

	caster.visible_message(span_notice("[caster] kneels and begins tracing symbols on the ground with ash."), span_notice("I begin inscribing a rune ward..."))
	if(!do_after(caster, adjusted_time, target = target_turf))
		to_chat(caster, span_warning("My concentration breaks."))
		return FALSE

	var/rune_path
	switch(choice)
		if("Stun")
			rune_path = /obj/structure/rune_ward/stun
		if("Fire")
			rune_path = /obj/structure/rune_ward/fire
		if("Chill")
			rune_path = /obj/structure/rune_ward/chill
		if("Damage")
			rune_path = /obj/structure/rune_ward/damage
		if("Alarm")
			rune_path = /obj/structure/rune_ward/alarm

	if(!rune_path)
		return FALSE

	var/obj/structure/rune_ward/rune = new rune_path(target_turf)
	rune.owner_ref = WEAKREF(caster)
	rune.spell_ref = WEAKREF(src)
	rune.owner_name = caster.real_name
	rune.owner_ckey = caster.ckey || "no ckey"
	active_runes += rune
	RegisterSignal(rune, COMSIG_QDELETING, PROC_REF(on_rune_destroyed))

	if(length(active_runes) > max_runes)
		var/obj/structure/rune_ward/oldest = active_runes[1]
		if(!QDELETED(oldest))
			oldest.visible_message(span_warning("The oldest rune fades as its creator inscribes a new one."))
			qdel(oldest)

	caster.visible_message(span_notice("[caster] finishes inscribing a rune on the ground."), span_notice("I finish the [choice] rune ward."))
	playsound(target_turf, 'sound/magic/whiteflame.ogg', 30, TRUE)

	StartCooldown()
	qdel(hand)
	return FALSE

/datum/action/cooldown/spell/undirected/touch/rune_ward/proc/scrub_rune(obj/item/melee/touch_attack/hand, atom/victim, mob/living/carbon/caster)
	// Either an /obj/structure/trap or an /obj/structure/rune_ward - they share no common parent beyond /obj/structure.
	var/obj/structure/target_trap
	if(istype(victim, /obj/structure/trap) || istype(victim, /obj/structure/rune_ward))
		target_trap = victim
	else
		var/turf/T = get_turf(victim)
		if(T)
			target_trap = locate(/obj/structure/rune_ward) in T

	if(!target_trap)
		to_chat(caster, span_warning("There is no rune or trap here to scrub."))
		return FALSE

	if(!caster.Adjacent(target_trap))
		to_chat(caster, span_warning("I need to be adjacent to scrub this."))
		return FALSE

	var/skill_level = GET_MOB_SKILL_VALUE(caster, associated_skill)
	var/skilled = skill_level >= SKILL_LEVEL_EXPERT

	if(skilled)
		caster.visible_message(span_notice("[caster] carefully passes a hand over the ground."), span_notice("I begin carefully unraveling the ward..."))
	else
		caster.visible_message(span_warning("[caster] begins scrubbing at something on the ground."), span_notice("I begin scrubbing at the ward..."))

	var/scrub_time = skilled ? scrub_time_skilled : scrub_time_unskilled

	if(!do_after(caster, scrub_time, target = target_trap))
		to_chat(caster, span_warning("My concentration breaks!"))
		if(!skilled && !QDELETED(target_trap))
			backfire_scrub(target_trap, caster)
		return FALSE

	if(QDELETED(target_trap))
		return FALSE

	if(skilled)
		to_chat(caster, span_notice("I silently erase the ward."))
	else
		caster.visible_message(span_notice("[caster] scrubs away a ward from the ground."), span_notice("I manage to scrub away the ward."))

	qdel(target_trap)
	return FALSE

/// Called when an unskilled scrub is interrupted - the ward or trap goes off on the scrubber.
/datum/action/cooldown/spell/undirected/touch/rune_ward/proc/backfire_scrub(obj/structure/target, mob/living/carbon/caster)
	if(istype(target, /obj/structure/rune_ward))
		var/obj/structure/rune_ward/rune = target
		// A caster fumbling their own rune is spared, same as walking over it.
		if(rune.owner_ref?.resolve() == caster)
			return
		log_combat(caster, rune, "triggered [rune.name] placed by [rune.owner_name] ([rune.owner_ckey]) while scrubbing at [AREACOORD(rune)]")
		rune.rune_effect(caster)
		rune.trigger_visual()
		qdel(rune)
		return

	if(istype(target, /obj/structure/trap))
		var/obj/structure/trap/trap = target
		if(trap.charges > 0)
			trap.trigger_step_on(caster)

/// Runes drawn via Rune Ward let the caster's memorized allies pass.
/// Battle Ward runes have no spell_ref, so they are unaffected and still hit everyone but the caster.
/// Note: relies on this file being included after battle_ward.dm so ..() reaches the base Crossed().
/obj/structure/rune_ward/Crossed(atom/movable/AM)
	var/datum/action/cooldown/spell/undirected/touch/rune_ward/ward_spell = spell_ref?.resolve()
	if(istype(ward_spell) && isliving(AM) && ward_spell.is_ally(AM))
		return
	return ..()

/obj/item/melee/touch_attack/rune_ward
	name = "\improper inscribing hand"
	desc = "Arcyne energy crackles at your fingertips, ready to inscribe wards. Touch yourself to dismiss."
	possible_item_intents = list(/datum/intent/hand/draw, /datum/intent/hand/clean, /datum/intent/use)
	icon = 'icons/mob/roguehudgrabs.dmi'
	icon_state = "grabbing_greyscale"
	color = "#FF8844"
	experimental_inhand = FALSE
