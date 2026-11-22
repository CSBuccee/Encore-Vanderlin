/datum/round_event_control/pomette_marriage
	name = "Marriage Broker"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/pomette_marriage
	weight = 7
	earliest_start = 15 MINUTES
	max_occurrences = 0 // TODO: turn off until we can properly remove this or rework it to something less annoying to others and feasible for the player
	min_players = LOWPOP_THRESHOLD

	tags = list(
		TAG_POMETTE,
		TAG_BOON,
		TAG_WIDESPREAD,
	)

/datum/round_event_control/pomette_marriage/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/divine/pomette))
			continue
		return TRUE

	return FALSE

/datum/round_event/pomette_marriage/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/divine/pomette))
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/marriage_broker/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE POMETTE'S CHOSEN!"),
		span_notice("Pomette wishes to see love blossom! Arrange a marriage between any two people to earn Pomette's favor!"),
	))
	to_chat(chosen_one, span_notice("You were given a power to conduct secret marriage ceremonies outside of the chapel. Let nothing stand in the way of true love!"))
	chosen_one.playsound_local(chosen_one, 'sound/vo/female/gen/giggle (1).ogg', 100)

	chosen_one.mind.announce_personal_objectives()
