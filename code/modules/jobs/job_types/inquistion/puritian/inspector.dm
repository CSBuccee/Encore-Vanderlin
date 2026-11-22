/datum/attribute_holder/sheet/job/inspector
	raw_attribute_list = list(
		STAT_PERCEPTION = 4,
		STAT_SPEED = 4,
		STAT_INTELLIGENCE = 2,
		STAT_STRENGTH = 1,
		/datum/attribute/skill/misc/lockpicking = 50,
		/datum/attribute/skill/misc/sneaking = 50,
		/datum/attribute/skill/combat/knives = 40,
		/datum/attribute/skill/misc/climbing = 40,
		/datum/attribute/skill/misc/athletics = 40,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/misc/medicine = 30,
		/datum/attribute/skill/misc/sewing = 20,
		/datum/attribute/skill/combat/firearms = 40,
	)

/datum/attribute_holder/sheet/job/retribution
	clamped_adjustment = list(
		/datum/attribute/skill/combat/swords = list(40, 40)
	)

/datum/attribute_holder/sheet/job/daybreak
	clamped_adjustment = list(
		/datum/attribute/skill/combat/whipsflails = list(40, 40)
	)

/datum/attribute_holder/sheet/job/sanctum
	clamped_adjustment = list(
		/datum/attribute/skill/combat/polearms = list(40, 40)
	)

/datum/attribute_holder/sheet/job/retribution
	clamped_adjustment = list(
		/datum/attribute/skill/combat/swords = list(40, 40)
	)
/datum/job/advclass/puritan/inspector
	title = "Inquisitor"
	tutorial = "One of the heads of the Inquisition's Shadow Chapter upon Domotan Island, your lessons are of a subtle touch and a light step. A silver dagger in the right place at the right time is all that is needed. Preparation is key, and this is something you impart on your students. Be always ready, be always waiting, and always be vigilant."
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	outfit = /datum/outfit/inquisitor/inspector
	spells = list(/datum/action/cooldown/spell/undirected/list_target/convert_role/adept)
	category_tags = list(CTAG_PURITAN)

	traits = list(
		TRAIT_STEELHEARTED,
		TRAIT_DODGEEXPERT,
		TRAIT_BLACKBAGGER,
		TRAIT_MEDIUMARMOR,
		TRAIT_INQUISITION,
		TRAIT_SILVER_BLESSED,
		TRAIT_PURITAN,
		TRAIT_ANGROSIAN_GRIT,
		TRAIT_ANGROSIAN,
		TRAIT_FOREIGNER,
		TRAIT_RECOGNIZED,
	)

	attribute_sheet = /datum/attribute_holder/sheet/job/inspector

/datum/job/advclass/puritan/inspector/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	GLOB.inquisition.add_member_to_position(spawned, GLOB.inquisition.venatari, 100)

/datum/job/advclass/puritan/inspector/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	var/static/list/gear = list(
		"Retribution (Rapier)",
		"Daybreak (Whip)",
		"Sanctum (Halberd)",
		"Remembrance (Long Sword)",
		"Martyrdom (Spear)"
	)
	var/weapon_choice = browser_input_list(spawned, "CHOOSE YOUR RELIQUARY PIECE.", "WIELD THEM IN HIS NAME.", gear)
	switch(weapon_choice)
		if("Retribution (Rapier)")
			spawned.put_in_hands(new /obj/item/weapon/sword/rapier/psy/relic(spawned), TRUE)
			spawned.equip_to_slot_or_del(new /obj/item/weapon/scabbard/sword, ITEM_SLOT_BELT_L, TRUE)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/retribution)

		if("Daybreak (Whip)")
			spawned.put_in_hands(new /obj/item/weapon/whip/angros/relic(spawned), TRUE)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/daybreak)

		if("Sanctum (Halberd)")
			spawned.put_in_hands(new /obj/item/weapon/polearm/halberd/angros/relic(spawned), TRUE)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/sanctum)

		if("Martyrdom (Spear)")
			spawned.put_in_hands(new /obj/item/weapon/polearm/spear/angros/relic(spawned), TRUE)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/sanctum)

		if("Remembrance (Long Sword)")
			spawned.put_in_hands(new /obj/item/weapon/sword/long/angros/relic(spawned), TRUE)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/retribution)

/datum/outfit/inquisitor/inspector
	name = "Inspector (Prefect)"
	shirt = /obj/item/clothing/armor/gambeson/heavy/inq
	belt = /obj/item/storage/belt/leather/knifebelt/black/angros
	neck = /obj/item/clothing/neck/gorget
	shoes = /obj/item/clothing/shoes/otavan/inqboots
	pants = /obj/item/clothing/pants/tights/colored/black
	backr =  /obj/item/storage/backpack/satchel/otavan
	beltl = /obj/item/ammo_holder/bullet/bullets
	beltr = /obj/item/gun/ballistic/powder/wheellock/puffer
	head = /obj/item/clothing/head/leather/inqhat
	mask = /obj/item/clothing/face/spectacles/inq/spawnpair
	gloves = /obj/item/clothing/gloves/leather/otavan
	ring = /obj/item/clothing/ring/signet/silver
	armor = /obj/item/clothing/armor/medium/scale/inqcoat/armored
	r_hand = /obj/item/reagent_containers/glass/bottle/aflask
	backpack_contents = list(
		/obj/item/storage/keyring/inquisitor = 1,
		/obj/item/lockpickring/mundane = 1,
		/obj/item/weapon/knife/dagger/silver/angros,
		/obj/item/clothing/head/inqarticles/blackbag = 1,
		/obj/item/inqarticles/garrote = 1,
		/obj/item/rope/inqarticles/inquirycord = 1,
		/obj/item/grapplinghook = 1,
		/obj/item/paper/inqslip/arrival/inq = 1,
	)

/datum/outfit/inquisitor/inspector/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	switch(equipped_human.patron?.type)
		if(/datum/patron/divine/centrist)
			wrists = /obj/item/clothing/neck/psycross/silver/divine
		if(/datum/patron/angros)
			wrists = /obj/item/clothing/neck/psycross/silver
