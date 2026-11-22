/datum/round_event_control/valdala_embrace
	name = "Valdala's Embrace"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/valdala_embrace
	weight = 5
	earliest_start = 35 MINUTES
	max_occurrences = 0 // TODO: this is super hilarious in a macabre way, but let's not have people ending themselves. marked for removal
	min_players = MIDPOP_THRESHOLD

	tags = list(
		TAG_VALDALA,
		TAG_HAUNTED,
	)

/datum/round_event_control/valdala_embrace/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(H.age != AGE_OLD)
			continue
		if(!H.patron || !is_tennite(H))
			continue
		return TRUE

	return FALSE

/datum/round_event/valdala_embrace/start()
	var/list/valdala_targets = list()
	var/list/tennite_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(human_mob.age != AGE_OLD)
			continue
		if(!human_mob.patron || !is_tennite(human_mob))
			continue

		if(istype(human_mob.patron, /datum/patron/divine/valdala))
			valdala_targets += human_mob
		else
			tennite_targets += human_mob

	var/list/valid_targets = valdala_targets.len ? valdala_targets : tennite_targets

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/embrace_death/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE MARKED BY VALDALA!"),
		span_biginfo("You have lived a good life as a follower of the Aspects, but everything must come to an end. Valdala wishes you to embrace death and earn a well deserved rest. Say goodbye to your loved ones, and take care of all remaining affairs, for this death will final. Your soul will have a guaranteed place in the Cycle."),
	))
	chosen_one.playsound_local(chosen_one, 'sound/ambience/noises/genspooky (1).ogg', 100)

	chosen_one.mind.announce_personal_objectives()
