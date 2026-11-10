#define MARK_RECALL_MODE_MARK "mark"
#define MARK_RECALL_MODE_RECALL "recall"

/datum/action/cooldown/spell/mark_recall
	button_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Mark and Recall"
	desc = "Bind a place to your memory, then return to it at will.\n\
	MARK anchors a sigil to the ground beneath your feet.\n\
	RECALL returns you to your sigil, dragging along anyone standing beside you.\n\
	Use Shift-G to switch."
	button_icon_state = "deathdoor"
	sound = 'sound/magic/blink.ogg'

	click_to_activate = TRUE

	required_form = FORM_AIR
	required_technique = TECHNIQUE_ALTERATION

	spell_cost = 20

	invocation = "Signum!"
	invocation_type = INVOCATION_WHISPER

	charge_required = TRUE
	charge_time = CHARGETIME_MINOR
	charge_slowdown = CHARGING_SLOWDOWN_SMALL
	charge_sound = 'sound/magic/charging.ogg'
	cooldown_time = 10 SECONDS

	spell_impact_intensity = SPELL_IMPACT_NONE
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC | SPELL_REQUIRES_HUMAN

	var/recall_mode = MARK_RECALL_MODE_MARK
	/// The turf we will return to on recall.
	var/turf/marked_turf
	var/mark_cost = 20
	var/mark_charge_time = CHARGETIME_MINOR
	var/mark_cooldown = 10 SECONDS
	var/recall_cost = 80
	var/recall_charge_time = CHARGETIME_BARRAGE
	var/recall_cooldown = 3 MINUTES
	var/static/list/mode_labels = list(MARK_RECALL_MODE_MARK = "MARK", MARK_RECALL_MODE_RECALL = "RECALL")
	var/static/list/mode_invocations = list(MARK_RECALL_MODE_MARK = "Signum!", MARK_RECALL_MODE_RECALL = "Reditus!")

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
		to_chat(owner, span_warning("I have no mark to return to!"))
		return . | SPELL_CANCEL_CAST
	if(marked_turf == here)
		to_chat(owner, span_warning("I am already standing on my mark."))
		return . | SPELL_CANCEL_CAST

/datum/action/cooldown/spell/mark_recall/cast(atom/cast_on)
	. = ..()
	if(recall_mode == MARK_RECALL_MODE_MARK)
		do_mark()
	else
		do_recall()
	return TRUE

/datum/action/cooldown/spell/mark_recall/proc/do_mark()
	marked_turf = get_turf(owner)
	new /obj/effect/temp_visual/blink(marked_turf, owner.dir)
	owner.visible_message(span_notice("[owner] traces a glowing sigil into the ground."), span_notice("I bind this place to my memory."))

/datum/action/cooldown/spell/mark_recall/proc/do_recall()
	var/turf/start = get_turf(owner)

	// Gather passengers before the caster leaves so we grab who was actually beside them
	var/list/mob/living/passengers = list()
	for(var/mob/living/L in orange(1, start))
		if(L.anchored)
			continue
		if(L.can_block_magic())
			to_chat(L, span_warning("The pull of [owner]'s magic washes over me harmlessly."))
			continue
		passengers += L

	if(owner.buckled)
		owner.buckled.unbuckle_mob(owner, TRUE)

	new /obj/effect/temp_visual/blink(start, owner.dir)
	if(!do_teleport(owner, marked_turf, channel = TELEPORT_CHANNEL_MAGIC))
		to_chat(owner, span_warning("My recall falters - something blocks the way to my mark!"))
		return
	new /obj/effect/temp_visual/blink(marked_turf, owner.dir)
	playsound(marked_turf, 'sound/magic/blink.ogg', 65, TRUE)
	owner.visible_message(span_danger("<b>[owner] arrives on a sudden gust of wind!</b>"), span_notice("<b>I return to my mark!</b>"))

	var/list/turf/landing_spots = list()
	for(var/turf/T in orange(1, marked_turf))
		if(T.density || istransparentturf(T) || T.is_blocked_turf(exclude_mobs = TRUE))
			continue
		landing_spots += T

	for(var/mob/living/L as anything in passengers)
		if(QDELETED(L))
			continue
		L.buckled?.unbuckle_mob(L, TRUE)
		var/turf/dest = length(landing_spots) ? pick(landing_spots) : marked_turf
		if(do_teleport(L, dest, channel = TELEPORT_CHANNEL_MAGIC))
			to_chat(L, span_warning("I am wrenched through space alongside [owner]!"))

#undef MARK_RECALL_MODE_MARK
#undef MARK_RECALL_MODE_RECALL
