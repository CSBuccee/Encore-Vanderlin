#define MARK_RECALL_MODE_MARK "mark"
#define MARK_RECALL_MODE_RECALL "recall"

/datum/action/cooldown/spell/mark_recall
	button_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Mark and Recall"
	desc = "Bind a place to your memory, then wrought open a magickal gateway back at will.\n\
	MARK anchors a sigil to the ground beneath your feet.\n\
	RECALL opens a gateway to your sigil, allowing yourself and others to pass through.\n\
	Use Shift-G to switch."
	button_icon_state = "deathdoor"
	sound = 'sound/magic/blink.ogg'

	click_to_activate = TRUE

	required_form = FORM_AIR
	required_technique = TECHNIQUE_ALTERATION
	required_items = list(/obj/item/spellbook)
	required_level = 6

	spell_cost = 20

	invocation = "Signum!"
	invocation_type = INVOCATION_WHISPER

	charge_required = TRUE
	charge_time = CHARGETIME_MINOR
	charge_slowdown = CHARGING_SLOWDOWN_HEAVY
	charge_sound = 'sound/magic/charging.ogg'
	cooldown_time = 10 SECONDS
	cast_range = 3

	spell_impact_intensity = SPELL_IMPACT_NONE
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC | SPELL_REQUIRES_HUMAN

	var/recall_mode = MARK_RECALL_MODE_MARK
	/// The turf we will return to on recall.
	var/turf/marked_turf
	var/mark_cost = 20
	var/mark_charge_time = CHARGETIME_MINOR
	var/mark_cooldown = 10 SECONDS
	var/recall_cost = 80
	var/recall_charge_time = 10 SECONDS
	var/recall_cooldown = 8 MINUTES
	var/portal_lifetime = 60 SECONDS
	var/static/list/mode_labels = list(MARK_RECALL_MODE_MARK = "MARK", MARK_RECALL_MODE_RECALL = "RECALL")
	var/static/list/mode_invocations = list(MARK_RECALL_MODE_MARK = "Signum!", MARK_RECALL_MODE_RECALL = "MAGNAM PORTAM ADAPERIRE!")

/datum/action/cooldown/spell/mark_recall/Grant(mob/grant_to)
	. = ..()
	update_mode_maptext()

/datum/action/cooldown/spell/mark_recall/Destroy()
	marked_turf = null
	return ..()

/datum/action/cooldown/spell/mark_recall/toggle_alt_mode(mob/user)
	recall_mode = (recall_mode == MARK_RECALL_MODE_MARK) ? MARK_RECALL_MODE_RECALL : MARK_RECALL_MODE_MARK
	apply_mode_stats()
	to_chat(user, span_notice("Mark and Recall set to: [mode_labels[recall_mode]]."))
	update_mode_maptext()
	return TRUE

/datum/action/cooldown/spell/mark_recall/proc/apply_mode_stats()
	invocation = mode_invocations[recall_mode]
	if(recall_mode == MARK_RECALL_MODE_RECALL)
		spell_cost = recall_cost
		charge_time = recall_charge_time
		cooldown_time = recall_cooldown
		invocation_type = INVOCATION_SHOUT
	else
		spell_cost = mark_cost
		charge_time = mark_charge_time
		cooldown_time = mark_cooldown
		invocation_type = INVOCATION_WHISPER

/datum/action/cooldown/spell/mark_recall/proc/update_mode_maptext()
	var/label = mode_labels[recall_mode]
	for(var/datum/hud/hud as anything in viewers)
		var/atom/movable/screen/movable/action_button/B = viewers[hud]
		var/atom/movable/screen/arc_maptext_holder/holder
		for(var/atom/movable/screen/arc_maptext_holder/existing in B.vis_contents)
			holder = existing
			break
		if(!holder)
			holder = new(B)
			B.vis_contents.Add(holder)
		holder.maptext = MAPTEXT(label)
		holder.maptext_x = 3
		holder.color = GLOB.form_colors[FORM_AIR]

/datum/action/cooldown/spell/mark_recall/before_cast(atom/cast_on)
	. = ..()
	if(. & SPELL_CANCEL_CAST)
		return
	var/turf/here = get_turf(owner)
	var/turf/target_turf = get_turf(cast_on)
	if(recall_mode == MARK_RECALL_MODE_MARK)
		if(!here || istransparentturf(here))
			to_chat(owner, span_warning("There is nothing here to anchor my sigil to!"))
			return . | SPELL_CANCEL_CAST
		var/area/A = get_area(here)
		if(A.area_flags & NO_TELEPORT)
			to_chat(owner, span_warning("Something in this place refuses my sigil."))
			return . | SPELL_CANCEL_CAST
		return
	if(!marked_turf)
		to_chat(owner, span_warning("I have no mark to open a gate to!"))
		return . | SPELL_CANCEL_CAST
	if(marked_turf == here)
		to_chat(owner, span_warning("I am already standing on my mark."))
		return . | SPELL_CANCEL_CAST
	if(marked_turf == target_turf)
		to_chat(owner, span_warning("I can not open an entry gate in the same space as the exit."))
		return . | SPELL_CANCEL_CAST
	var/area/tt = get_area(target_turf)
	var/area/mt = get_area(marked_turf)
	if((tt.area_flags & NO_TELEPORT) || (mt.area_flags & NO_TELEPORT))
		to_chat(owner, span_warning("Something is supressing the gateway from forming."))
		return . | SPELL_CANCEL_CAST

/datum/action/cooldown/spell/mark_recall/cast(atom/cast_on)
	. = ..()
	if(recall_mode == MARK_RECALL_MODE_MARK)
		do_mark()
	else
		var/turf/target_turf = get_turf(cast_on)
		if(!target_turf)
			return FALSE
		open_gateway(target_turf)
	return TRUE

/datum/action/cooldown/spell/mark_recall/proc/do_mark()
	marked_turf = get_turf(owner)
	new /obj/effect/temp_visual/blink(marked_turf, owner.dir)
	owner.visible_message(span_notice("[owner] traces a glowing sigil into the ground."), span_notice("I bind this place to my memory."))

/datum/action/cooldown/spell/mark_recall/proc/open_gateway(turf/cast_turf)
	new /obj/effect/portal/mage_gateway(cast_turf, src, portal_lifetime, null, FALSE, marked_turf)
	new /obj/effect/exit_gateway(marked_turf, portal_lifetime)

// ---- MAGE GATEWAY SUPPORT OBJECTS ----

/obj/effect/portal/mage_gateway
	name = "Magickal Gateway"
	desc = "An open portal that shimmers and thrums with arcyne power. It tugs and pulls at the surroundings."
	icon = 'icons/effects/effects.dmi'
	icon_state = "void_conduit"

/obj/effect/portal/mage_gateway/teleport(atom/movable/M, force = FALSE)
	. = ..()
	if(.)
		playsound(src, 'sound/misc/portalactivate.ogg', 80, TRUE)
		playsound(M, 'sound/misc/portalactivate.ogg', 80, TRUE)
		if(iscarbon(M))
			// a little razzle dazzle for people warping
			flick_overlay_view(mutable_appearance('icons/effects/effects.dmi', "paperwiz_poof"), 9)
			M.visible_message(span_warning("[M] suddenly appears through the portal!"), span_warning("I suddenly appear somewhere else after feeling space warp around me!"))
	else if(isliving(M))
		// teleport failed, let players know
		var/mob/living/L = M
		if(L.client)
			to_chat(L, span_warning("I am unable to enter - something blocks the way through!"))


/obj/effect/portal/mage_gateway/Initialize(mapload, _creator, _lifespan = 0, obj/effect/portal/_linked, automatic_link = FALSE, turf/hard_target_override, atmos_link_override)
	..()
	set_light(3, 2, 20, l_color = LIGHT_COLOR_BLUE)
	visible_message(span_danger("<b>A large shimmering portal bursts opens and whips wind towards it!</b>"), blind_message = "I hear a thrumming rift open!")
	playsound(src, 'sound/magic/shadowstep_destination.ogg', 100, FALSE)

/obj/effect/portal/mage_gateway/Destroy()
	visible_message(span_boldnotice("[src] shudders before rapidly closing."))
	playsound(src, 'sound/magic/ethereal_enter.ogg', 80, TRUE)
	return ..()

// just a spawnable effect to visualize the one-way portal exit
/obj/effect/exit_gateway
	name = "Exit Gateway"
	desc = "An open portal that shimmers with arcyne power. It pushes and refuses entry."
	icon = 'icons/effects/effects.dmi'
	icon_state = "void_conduit"

/obj/effect/exit_gateway/Initialize(mapload, _lifespan = 0)
	..()
	set_light(3, 2, 20, l_color = LIGHT_COLOR_BLUE)
	visible_message(span_danger("<b>A large shimmering portal bursts opens and wind blows out of it!</b>"), blind_message = "I hear a thrumming rift open!")
	playsound(src, 'sound/magic/shadowstep_destination.ogg', 100, FALSE)
	if (_lifespan > 0)
		QDEL_IN(src, _lifespan)

/obj/effect/exit_gateway/Destroy()
	visible_message(span_boldnotice("[src] shudders before rapidly closing."))
	playsound(src, 'sound/magic/ethereal_enter.ogg', 80, TRUE)
	return ..()

#undef MARK_RECALL_MODE_MARK
#undef MARK_RECALL_MODE_RECALL
