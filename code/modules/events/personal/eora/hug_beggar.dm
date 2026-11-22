/datum/round_event_control/pomette_compassion
	name = "Spreading Compassion"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/pomette_compassion
	weight = 10
	earliest_start = 5 MINUTES
	max_occurrences = 1
	min_players = LOWPOP_THRESHOLD

	tags = list(
		TAG_POMETTE,
		TAG_BOON,
	)

/datum/round_event_control/pomette_compassion/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	var/player_count = 0
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		player_count++
		if(player_count >= 5)
			break

	if(player_count < 5)
		return FALSE

	// make sure there is a pomette player to recieve this quest
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(H.patron && istype(H.patron, /datum/patron/divine/pomette))
			return TRUE

	return FALSE

/datum/round_event/pomette_compassion/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(H.patron && istype(H.patron, /datum/patron/divine/pomette))
			valid_targets += H

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)
	var/datum/objective/personal/hug_beggar/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE POMETTE'S CHOSEN!"),
		span_notice("Pomette wishes to see compassion! Spread kindness and love to others by hugging people to earn Pomette's favor!"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/vo/female/gen/giggle (1).ogg', 100)

	chosen_one.mind.announce_personal_objectives()
