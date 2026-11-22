GLOBAL_VAR(lordsurname)
GLOBAL_LIST_EMPTY(lord_titles)

/datum/attribute_holder/sheet/job/lord
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		STAT_INTELLIGENCE = 3,
		STAT_ENDURANCE = 3,
		STAT_SPEED = 1,
		STAT_PERCEPTION = 2,
		STAT_FORTUNE = 5,
		/datum/attribute/skill/combat/polearms = 20,
		/datum/attribute/skill/combat/axesmaces = 20,
		/datum/attribute/skill/combat/crossbows = 30,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/combat/swords = 40,
		/datum/attribute/skill/combat/knives = 30,
		/datum/attribute/skill/misc/swimming = 10,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 40,
		/datum/attribute/skill/misc/riding = 30,
		/datum/attribute/skill/labor/mathematics = 30
	)

/datum/attribute_holder/sheet/job/lord/old
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		STAT_INTELLIGENCE = 3,
		STAT_ENDURANCE = 3,
		STAT_SPEED = 1,
		STAT_PERCEPTION = 2,
		STAT_FORTUNE = 5,
		/datum/attribute/skill/combat/polearms = 20,
		/datum/attribute/skill/combat/axesmaces = 20,
		/datum/attribute/skill/combat/crossbows = 30,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/combat/swords = 50,
		/datum/attribute/skill/combat/knives = 30,
		/datum/attribute/skill/misc/swimming = 10,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 40,
		/datum/attribute/skill/misc/riding = 30,
		/datum/attribute/skill/labor/mathematics = 30
	)

/datum/job/lord
	title = JOB_MONARCH
	var/ruler_title = "Regent"
	tutorial = "You were appointed your throne by King Malryck whose seat you occupy in their absence. You are the absolute authority of this island, and are at the center of every plot within it. Don't disappoint your mother, Queen Alyssandrine herself."
	department_flag = NOBLEMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_LORD
	factions = list(FACTION_TOWN, SUB_FACTION_KEEP, SUB_FACTION_VAULT)
	total_positions = 1
	spawn_positions = 1
	spells = list(
		/datum/action/cooldown/spell/undirected/list_target/grant_title,
		/datum/action/cooldown/spell/undirected/list_target/grant_nobility,
	)
	allowed_races = RACES_PLAYER_ROYALTY
	allowed_patrons = /datum/devotion/inhumen/envy
	outfit = /datum/outfit/lord
	bypass_lastclass = TRUE
	give_bank_account = 500

	knows_the_town = TRUE
	known_by_the_town = TRUE
	jobs_always_know_me = list(JOB_COURT_AGENT)

	selection_color = "#7851A9"
	cmode_music = 'sound/music/cmode/nobility/combat_noble.ogg'
	can_have_apprentices = FALSE
	job_bitflag = BITFLAG_ROYALTY
	exp_type = list(EXP_TYPE_NOBLE, EXP_TYPE_LIVING, EXP_TYPE_LEADERSHIP)
	exp_types_granted = list(EXP_TYPE_NOBLE, EXP_TYPE_LEADERSHIP)
	exp_requirements = list(
		EXP_TYPE_LIVING = 1200,
		EXP_TYPE_NOBLE = 900,
		EXP_TYPE_LEADERSHIP = 300
	)

	attribute_sheet = /datum/attribute_holder/sheet/job/lord
	attribute_sheet_old = /datum/attribute_holder/sheet/job/lord/old

	//These change on map load
	honorary = "Prince"
	honorary_f = "Princess"

	mind_traits = list(
		TRAIT_KNOW_KEEP_DOORS,
		TRAIT_KNOWCOURTAGENTS
	)
	traits = list(
		TRAIT_NOBLE_BLOOD,
		TRAIT_NOBLE_POWER,
		TRAIT_NOBLE_LOCAL,
		TRAIT_NOSEGRAB,
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
	)

	voicepack_m = /datum/voicepack/male/evil

/datum/job/lord/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_shirleigh_strong()
		devotion.grant_to(spawned)

/datum/job/lord/New()
	. = ..()
	if(SSmapping.config?.monarch_title)
		honorary = SSmapping.config.monarch_title
		honorary_f = SSmapping.config.monarch_title //in case we dont have a female title and they share
	if(SSmapping.config?.monarch_title_f)
		honorary_f = SSmapping.config.monarch_title_f

/datum/job/lord/get_informed_title(mob/mob, ignore_pronouns, change_title = FALSE, new_title)
	if(change_title)
		ruler_title = new_title
		return "[ruler_title]"
	else
		return "[ruler_title]"

/datum/job/lord/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	SSticker.rulermob = spawned

	addtimer(CALLBACK(spawned, TYPE_PROC_REF(/mob/living/carbon/human, lord_color_choice)), 7 SECONDS)

	if(spawned.pronouns != SHE_HER)
		ruler_title = "[SSmapping.config.monarch_title]"
	else
		ruler_title = "[SSmapping.config.monarch_title_f]"

	if(spawned.gender == MALE)
		SSfamilytree.AddRoyal(spawned, FAMILY_FATHER)
	else
		SSfamilytree.AddRoyal(spawned, FAMILY_MOTHER)

	to_chat(world, "<b>[span_notice(span_big("[spawned.real_name] is [ruler_title] of [SSmapping.config.map_name]."))]</b>")
	to_chat(world, "<br>")

	if(spawned.dna?.species?.id == SPEC_ID_HUMEN && spawned.gender == MALE)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/evil()

	if(player_client?.prefs)
		var/datum/preferences/prefs = player_client.prefs

		var/list/laws = prefs.read_preference(/datum/preference/list_type/role_setting/monarch_law)
		if(length(laws))
			GLOB.laws_of_the_land = list()
		for(var/law in laws)
			law = trim(law)
			GLOB.laws_of_the_land += trim(law)


		var/list/decrees = prefs.read_preference(/datum/preference/list_type/role_setting/monarch_decree)
		if(length(decrees))
			GLOB.lord_decrees = list()
		for(var/decree in decrees)
			decree = trim(decree)
			GLOB.lord_decrees += trim(decree)

/datum/outfit/lord
	name = JOB_MONARCH
	head = /obj/item/clothing/head/crown/serpcrown
	backr = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/plaquegold
	beltl = /obj/item/weapon/knife/dagger/steel/royal
	beltr = /obj/item/weapon/sword/rapier
	scabbards = list(/obj/item/weapon/scabbard/knife/royal, /obj/item/weapon/scabbard/sword/royal)
	ring = /obj/item/clothing/ring/active/nomag
	l_hand = /obj/item/weapon/lordscepter
	r_hand = /obj/item/storage/keyring/heir

	backpack_contents = list(
		/obj/item/storage/keyring/monarch = 1,
		/obj/item/servant_bell/lord = 1,
	)

/datum/outfit/lord/map_override(mob/living/carbon/human/H)
	if(SSmapping.config.map_name != "Voyage")
		return
	head = /obj/item/clothing/head/helmet/leather/tricorn
	cloak = /obj/item/clothing/cloak/half
	l_hand = null
	armor = /obj/item/clothing/armor/leather/jacket/silk_coat
	shirt = /obj/item/clothing/shirt/undershirt/puritan
	wrists = null
	shoes = /obj/item/clothing/shoes/boots/darkboots

/datum/outfit/lord/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()

	if(equipped_human.gender == MALE)
		pants = /obj/item/clothing/pants/trou/formal
		shirt = /obj/item/clothing/shirt/undershirt/fancy
		armor = /obj/item/clothing/armor/gambeson/arming
		shoes = /obj/item/clothing/shoes/nobleboot
		cloak = /obj/item/clothing/cloak/lordcloak
	else
		pants = /obj/item/clothing/pants/tights/colored/random
		armor = /obj/item/clothing/shirt/dress/royal
		shoes = /obj/item/clothing/shoes/nobleboot
		cloak = /obj/item/clothing/cloak/lordcloak/ladycloak
		wrists = /obj/item/clothing/wrists/royalsleeves

	if(equipped_human.wear_mask)
		if(istype(equipped_human.wear_mask, /obj/item/clothing/face/eyepatch))
			qdel(equipped_human.wear_mask)
			mask = /obj/item/clothing/face/lordmask
		else if(istype(equipped_human.wear_mask, /obj/item/clothing/face/eyepatch/left))
			qdel(equipped_human.wear_mask)
			mask = /obj/item/clothing/face/lordmask/l

/datum/job/exlord //just used to change the lords title
	title = "Ex-Monarch"
	department_flag = NOBLEMEN
	factions = list(FACTION_TOWN, FACTION_SHIRLEIGH, SUB_FACTION_KEEP, SUB_FACTION_VAULT)
	total_positions = 0
	spawn_positions = 0
	display_order = JDO_LORD
	honorary = "Former Lord"
	honorary_f = "Former Lady"

/datum/job/exlord/New()
	. = ..()
	if(SSmapping.config?.monarch_title)
		honorary = "Former [SSmapping.config.monarch_title]"
		honorary_f = "Former [SSmapping.config.monarch_title]" //in case we dont have a female title and they share
	if(SSmapping.config?.monarch_title_f)
		honorary_f = "Former [SSmapping.config.monarch_title_f]"

