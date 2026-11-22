//////////////Church stuff

/obj/item/handheld_bell
	name = "church bell"
	desc = "A small bell that can draw a crowd if needed."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "churchbell"
	throw_speed = 2
	throw_range = 5
	throwforce = 5
	damtype = BRUTE
	slot_flags = ITEM_SLOT_HIP
	force = 5
	hitsound = 'sound/items/bsmith1.ogg'
	item_weight = 600 GRAMS
	COOLDOWN_DECLARE(bell_ring)

/obj/item/handheld_bell/attack_self(mob/user, list/modifiers)
	. = ..()
	if(!COOLDOWN_FINISHED(src, bell_ring))
		return
	playsound(src, 'sound/misc/handbell.ogg', 50, 1)

	user.visible_message(span_notice("[user] rings [src]."), span_notice("You ring [src]."))
	for(var/mob/M in view(10, src.loc))
		if(M != user && M.client)
			to_chat(M, span_notice("You hear a small bell ringing."))

	COOLDOWN_START(src, bell_ring, 4 SECONDS)

/obj/item/handheld_bell/proc/sound_bell(mob/living/user)
	user.visible_message(span_warning("[user] rings the bell!"))
	playsound(src, 'sound/misc/handbell.ogg', 100, TRUE)
	var/turf/origin_turf = get_turf(src)

	for(var/mob/living/player in GLOB.player_list)
		if(player.stat == DEAD)
			continue
		if(isbrain(player))
			continue

		var/distance = get_dist(player, origin_turf)
		if(distance <= 7)
			continue
		var/dirtext = " to the "
		var/direction = get_dir(player, origin_turf)
		switch(direction)
			if(NORTH)
				dirtext += "north"
			if(SOUTH)
				dirtext += "south"
			if(EAST)
				dirtext += "east"
			if(WEST)
				dirtext += "west"
			if(NORTHWEST)
				dirtext += "northwest"
			if(NORTHEAST)
				dirtext += "northeast"
			if(SOUTHWEST)
				dirtext += "southwest"
			if(SOUTHEAST)
				dirtext += "southeast"
			else //Where ARE you.
				dirtext = ", although I cannot make out a direction"
		var/disttext
		switch(distance)
			if(0 to 20)
				disttext = " very close"
			if(20 to 40)
				disttext = " close"
			if(40 to 80)
				disttext = ""
			if(80 to 160)
				disttext = " far"
			else
				disttext = " very far"

		//sound played for other players
		player.playsound_local(get_turf(player), 'sound/misc/handbell.ogg', 35, FALSE, pressure_affected = FALSE)
		to_chat(player, span_warning("I hear the bell ring somewhere[disttext][dirtext]!"))

/obj/item/handheld_bell/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = -1,"sy" = 0,"nx" = 11,"ny" = 1,"wx" = 0,"wy" = 1,"ex" = 4,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 15,"sturn" = 0,"wturn" = 0,"eturn" = 39,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 8)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

//////////Stationary Church bell

/obj/structure/bell_barrier
	name = "invisible barrier"
	desc = "An invisible barrier that prevents movement."
	icon = null
	icon_state = ""
	density = TRUE
	opacity = FALSE
	anchored = TRUE
	invisibility = INVISIBILITY_MAXIMUM

/obj/structure/stationary_bell
	name = "church bell"
	desc = "A large cast bronze bell that rings out for all to hear."
	icon = 'icons/roguetown/misc/96x96.dmi'
	icon_state = "churchbell"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	COOLDOWN_DECLARE(bell_ring)

/obj/structure/stationary_bell/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if(!istype(tool, /obj/item/weapon/mace/church))
		return NONE

	if(!COOLDOWN_FINISHED(src, bell_ring))
		return ITEM_INTERACT_BLOCKING

	for(var/mob/M as anything in GLOB.player_list) // @everyone
		if(!M.client || HAS_TRAIT(M, TRAIT_DEAF)) // Disregard NPC's with no mind and sleeping/unconscious people
			continue
		to_chat(M, span_notice("[src] rings, echoing solemnly far and wide across the realm."))
		M.playsound_local(M, 'sound/misc/bell.ogg', 50, 1)

	visible_message(span_notice("[user] uses the [tool] to ring the [src]."))
	COOLDOWN_START(src, bell_ring, 5 SECONDS)
	return ITEM_INTERACT_SUCCESS

//////////Jingle Bells

/obj/item/jingle_bells
	name = "jingling bells"
	desc = "A set of small bells that jingle when shaken."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state =  "jingle_bells"
	throwforce = 5
	dropshrink = 0.5
	pickup_sound = SFX_JINGLE_BELLS
	drop_sound = SFX_JINGLE_BELLS
	item_weight = 100 GRAMS

/obj/item/jingle_bells/Initialize()
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, custom_sounds = list(SFX_JINGLE_BELLS))

// ---- YEOMAN DESK BELLS ---

// a bell ringing mental alert component inspired by the servant_bell.dm
/datum/component/dingaling_summon
	dupe_mode = COMPONENT_DUPE_HIGHLANDER
	var/hear_distance = 80
	var/ring_sound = "sound/items/servant_bell.ogg"

	// key: [weakref_to_player_mind] value: TRUE (muted) | FALSE (unmuted)
	var/list/listeners = list()

/datum/component/dingaling_summon/Initialize(mob/living/owner)
	. = ..()
	if(isliving(owner) && owner.mind)
		var/datum/weakref/owner_mind_ref = WEAKREF(owner.mind)
		listeners[owner_mind_ref] = FALSE
		to_chat(owner, span_notice("You link your mind to \the [parent]."))

/datum/component/dingaling_summon/RegisterWithParent()
	RegisterSignal(parent, "yeoman_bell_rung", PROC_REF(handle_ring))

/datum/component/dingaling_summon/UnregisterFromParent()
	UnregisterSignal(parent, "yeoman_bell_rung")

/datum/component/dingaling_summon/Destroy()
	// give listeners a heads up that their bell was unanchored or obliterated somehow
	for(var/datum/weakref/listener_ref in listeners)
		var/datum/mind/M = listener_ref.resolve()
		if(M.current)
			to_chat(M.current, span_boldwarning("I feel my mind's link forcibly break from [parent ? parent : "something"]!"))
	listeners = null
	return ..()

/datum/component/dingaling_summon/proc/toggle_listener(mob/living/user)
	if(!user.mind)
		return

	var/datum/weakref/user_ref = WEAKREF(user.mind)

	if(user_ref in listeners)
		listeners -= user_ref
		to_chat(user, span_notice("You unlink yourself from \the [parent]."))
		return
	else
		listeners[user_ref] = FALSE // default not muted
		to_chat(user, span_notice("You link your mind to \the [parent]."))

/datum/component/dingaling_summon/proc/toggle_mute(mob/living/user)
	if(!user.mind)
		return FALSE

	var/datum/weakref/user_ref = WEAKREF(user.mind)

	if(!(user_ref in listeners))
		return FALSE

	// toggle the mute value for this listener
	listeners[user_ref] = !listeners[user_ref]
	if(listeners[user_ref])
		to_chat(user, span_notice("You close your mind from hearing \the [parent] any further, but the link remains."))
	else
		to_chat(user, span_notice("You open your mind to hear \the [parent] again."))
	return TRUE // Successfully intercepted and toggled mute

/datum/component/dingaling_summon/proc/handle_ring(datum/source, mob/living/ringer)
	SIGNAL_HANDLER

	//Cycle through listeners
	for(var/datum/weakref/listener_ref in listeners)
		// If they have explicitly muted the bell, skip alerting
		if(listeners[listener_ref] == TRUE)
			continue

		var/datum/mind/M = listener_ref.resolve()
		if(M.current)
			send_alert(M.current, ringer)

/// Helper proc to safely format and send the directional message to a specific mob
/datum/component/dingaling_summon/proc/send_alert(mob/living/player, mob/living/ringer)
	var/turf/origin_turf = get_turf(parent)
	if(!player || !player.client)
		return
	if(player.stat >= DEAD)
		return
	if(player.can_block_magic(MAGIC_RESISTANCE_MIND, 0))
		return
	if(!is_in_zweb(player.z, origin_turf.z))
		to_chat(ringer, span_warning("I can feel that [player.real_name] is too far to have heard my ringing."))
		return
	var/distance = get_dist(player, origin_turf)
	if(distance > hear_distance)
		to_chat(ringer, span_warning("I can feel that [player.real_name] is too far to have heard my ringing."))
		return
	player.apply_status_effect(/datum/status_effect/signal_horn/servant_bell, null, origin_turf)
	var/dirText = ""
	var/z_dist = origin_turf.z - player.z
	if(z_dist != 0)
		var/abs_z = abs(z_dist) // we can tell which floor it's on if it's only 2 away
		switch(abs_z)
			if(1)
				dirText += " one story"
			if(2)
				dirText += " two stories"
			else
				dirText += " far"
		dirText += z_dist > 0 ? " above me" : " below me"
	to_chat(player, span_warning("I hear \the [parent] being rung[dirText]. The bell tells me their name is [ringer?.name ? ringer.name : "unknown"]. <a href='byond://?src=[REF(src)];mute=1'>\[Mute Ringing\]</a>"))
	// in the same room, so return before we play sound in players mind
	if(distance <= 7 && z_dist == 0)
		return
	//sound played for other players, by fem_tanyl !!!1!!
	//parent type agnostic grab so the component can be added to literally anything so long as it has "ring_sound", not as performant but very flexible.
	var/bell_sound = parent.vars["ring_sound"]
	if (!bell_sound)
		bell_sound = "sound/items/servant_bell.ogg"
	player.playsound_local(get_turf(player), bell_sound, 50, FALSE, pressure_affected = FALSE)

/datum/component/dingaling_summon/Topic(href, href_list)
	. = ..()
	var/mob/living/user = usr
	if(!istype(user) || !user.client)
		return

	if(href_list["mute"])
		toggle_mute(user)

// ---- YEOMAN BELL STRUCTURES AND ITEMS ----
/obj/structure/yeoman_bell
	name = "abstract yeoman bell base"
	desc = "You should not see this and this should not be craftable. When they touch my dingdingdong... my bingaling..."
	max_integrity = 80
	icon = 'icons/obj/dingdingding.dmi'
	icon_state = "stand"
	resistance_flags = FIRE_PROOF
	var/flick_state = "stand_dingaling"
	var/ring_sound = "sound/items/servant_bell.ogg"
	COOLDOWN_DECLARE(ring_bell_cd)
	var/cooldown = 1 MINUTES
	COOLDOWN_DECLARE(nearby_ring_bell_cd)
	var/nearby_cooldown = 5 SECONDS

/obj/structure/yeoman_bell/get_mechanics_examine(mob/user)
	. = list()
	. += span_notice("Left click with an open hand to ring it.")
	. += span_notice("Right click with an open hand to link or unlink your mind.")
	. += span_notice("Linked users can left click with an open hand to toggle mute for theirself on the bell without ringing it.")

/obj/structure/yeoman_bell/Destroy()
	qdel(GetComponent(/datum/component/dingaling_summon))
	return ..()

/obj/structure/yeoman_bell/proc/ring_bell(mob/living/ringer)
	flick(flick_state, src)
	playsound(src, ring_sound, 100, TRUE)
	if(!COOLDOWN_FINISHED(src, ring_bell_cd)) // anti spam for mental bings
		return
	COOLDOWN_START(src, ring_bell_cd, cooldown)
	SEND_SIGNAL(src, "yeoman_bell_rung", ringer)

/obj/structure/yeoman_bell/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	// If toggle_mute returns TRUE, it means we are a listener and we handled it.
	// return early to avoid ringing
	var/datum/component/dingaling_summon/binger = GetComponent(/datum/component/dingaling_summon)
	if(binger && binger.toggle_mute(user))
		playsound(src, 'sound/misc/deadbell.ogg', 80, TRUE) // very funny, im leaving it as spooky bell toll when muting
		return

	// Otherwise, attempt to ring the bell normally
	if(!COOLDOWN_FINISHED(src, nearby_ring_bell_cd)) // anti nearby spam
		return
	COOLDOWN_START(src, nearby_ring_bell_cd, nearby_cooldown)
	user.visible_message("[user] rings the [src].")
	ring_bell(user) // include user to notify who rang

/obj/structure/yeoman_bell/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(!user.client || !isliving(user))
		return

	. = SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

	var/datum/component/dingaling_summon/binger = GetComponent(/datum/component/dingaling_summon)
	if(!binger)
		AddComponent(/datum/component/dingaling_summon, user)
		return
	else
		binger.toggle_listener(user)

/obj/structure/yeoman_bell/bell_stand
	name = "bell stand"
	desc = "An enticing bingable ringable bell on a wooden stand."
	anchored = FALSE
	density = TRUE
	climbable = TRUE
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	destroy_sound = 'sound/combat/hits/onwood/destroyfurniture.ogg'

/obj/structure/yeoman_bell/hanging_bell
	name = "bell"
	desc = "A swaying ringable bell hanging from a chain."
	icon = 'icons/obj/dingdingding.dmi'
	icon_state = "bell"
	ring_sound = "sound/misc/handbell.ogg"
	flick_state = "bell_dingaling"
	anchored = TRUE
	density = FALSE
	layer = WALL_OBJ_LAYER
	attacked_sound = list('sound/combat/hits/onmetal/metalimpact (1).ogg', 'sound/combat/hits/onmetal/metalimpact (2).ogg')

/obj/structure/yeoman_bell/hanging_bell/Crossed(atom/movable/AM, oldLoc)
	return
/obj/structure/yeoman_bell/hanging_bell/up
	SET_BASE_PIXEL(0, 32)
/obj/structure/yeoman_bell/hanging_bell/down
	SET_BASE_PIXEL(0, -32)
/obj/structure/yeoman_bell/hanging_bell/right
	SET_BASE_PIXEL(32, 0)
/obj/structure/yeoman_bell/hanging_bell/left
	SET_BASE_PIXEL(-32, 0)

/obj/item/yeoman_bell/desk_bell
	name = "desk bell"
	desc = "A magical bell to alert the lazy workers."
	icon = 'icons/obj/dingdingding.dmi'
	icon_state = "table"
	var/flick_state = "table_dingaling"
	anchored = FALSE
	var/ring_sound = "sound/items/servant_bell.ogg"
	// reference to a /datum/mind
	var/datum/weakref/owner_mind_ref
	COOLDOWN_DECLARE(ring_bell_cd)
	var/cooldown = 1 MINUTES
	COOLDOWN_DECLARE(nearby_ring_bell_cd)
	var/nearby_cooldown = 5 SECONDS

/obj/item/yeoman_bell/desk_bell/get_mechanics_examine(mob/user)
	. = list()
	. += span_notice("Left click with an open hand to ring it.")
	. += span_notice("If not anchored, right click with an open hand to anchor, set yourself as owner, and link your mind.")
	. += span_notice("If anchored, only the owner can unanchor it by right clicking it again with open hand. Non-owners can link and unlink their mind to it this way.")
	. += span_notice("Linked users can left click with an open hand to toggle mute for theirself on the bell without ringing it.")

/obj/item/yeoman_bell/desk_bell/Destroy()
	owner_mind_ref = null
	qdel(GetComponent(/datum/component/dingaling_summon))
	return ..()

/obj/item/yeoman_bell/desk_bell/proc/ring_bell(mob/living/ringer)
	flick(flick_state, src)
	playsound(src, ring_sound, 100, TRUE)
	if(!COOLDOWN_FINISHED(src, ring_bell_cd)) // anti spam for mental bings
		return
	COOLDOWN_START(src, ring_bell_cd, cooldown)
	SEND_SIGNAL(src, "yeoman_bell_rung", ringer)

/obj/item/yeoman_bell/desk_bell/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if(anchored)
		// If toggle_mute returns TRUE, it means we are a listener and we handled it.
		// return early to avoid ringing
		var/datum/component/dingaling_summon/binger = GetComponent(/datum/component/dingaling_summon)
		if(binger && binger.toggle_mute(user))
			playsound(src, 'sound/misc/deadbell.ogg', 80, TRUE) // very funny, im leaving it as spooky bell toll when muting
			return

		// Otherwise, attempt to ring the bell normally
		if(!COOLDOWN_FINISHED(src, nearby_ring_bell_cd)) // anti nearby spam
			return
		COOLDOWN_START(src, nearby_ring_bell_cd, nearby_cooldown)
		user.visible_message("[user] rings the [src].")
		ring_bell(user) // include user to notify who rang

/obj/item/yeoman_bell/desk_bell/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(!user.client || !isliving(user))
		return

	. = SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	if(!anchored)
		anchored = TRUE
		owner_mind_ref = WEAKREF(user.mind)
		to_chat(user, span_notice("You anchor the bell and link it to your senses."))
		// Attach the component and pass the user as the owner
		AddComponent(/datum/component/dingaling_summon, user)
		return

	// we're anchored meaning we expect an owner, if owner still exists then enforce security, otherwise allow it to be unlocked
	var/datum/mind/owner = owner_mind_ref.resolve()
	if(owner && user.mind != owner)
		var/datum/component/dingaling_summon/binger = GetComponent(/datum/component/dingaling_summon)
		binger.toggle_listener(user)
	else
		INVOKE_ASYNC(src, PROC_REF(unanchor_confirmation), user)

/obj/item/yeoman_bell/desk_bell/proc/unanchor_confirmation(mob/living/user)
	var/confirmation = tgui_alert(user, "You are about to un-anchor the bell and sever all bound mental links, proceed?", "Affirm Your Intentions", list("Proceed","Nevermind"))
	if(confirmation != "Proceed")
		return

	// double check player is still capable post ui selection
	if(user.stat || !user.client || !anchored)
		return
	if(!user.Adjacent(src) && loc != user)
		return

	anchored = FALSE
	to_chat(user, span_notice("You un-anchor the bell, breaking all mental links it once held."))
	owner_mind_ref = null
	qdel(GetComponent(/datum/component/dingaling_summon))

