/datum/round_event_control/erdl_lux
	name = "Thauma Extraction Demand"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/erdl_lux
	weight = 7
	earliest_start = 15 MINUTES
	max_occurrences = 0 // TODO: no, this is heretical for erdl, but could be good if reworked for bog witches or something
	min_players = LOWPOP_THRESHOLD

	tags = list(
		TAG_ERDL,
		TAG_MEDICAL,
	)

/datum/round_event_control/erdl_lux/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/divine/erdl))
			continue
		if(GET_MOB_SKILL_VALUE(H, /datum/attribute/skill/misc/medicine) < SKILL_LEVEL_JOURNEYMAN)
			continue
		return TRUE

	return FALSE

/datum/round_event/erdl_lux/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/divine/erdl))
			continue
		if(GET_MOB_SKILL_VALUE(human_mob, /datum/attribute/skill/misc/medicine) < SKILL_LEVEL_JOURNEYMAN)
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/lux_extraction/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE ERDL'S CHOSEN!"),
		span_notice("Erdl is curious about the divine spark! Extract Thauma from a living being to earn Erdl's favor!"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/magic/cosmic_expansion.ogg', 100)

	chosen_one.mind.announce_personal_objectives()
