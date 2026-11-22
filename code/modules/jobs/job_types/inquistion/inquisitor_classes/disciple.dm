/datum/attribute_holder/sheet/job/disciple
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_ENDURANCE = 2,
		STAT_CONSTITUTION = 3,
		STAT_INTELLIGENCE = -2,
		STAT_SPEED = -1,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/misc/climbing = 30,
		/datum/attribute/skill/misc/swimming = 30,
		/datum/attribute/skill/misc/medicine = 20,
		/datum/attribute/skill/misc/reading = 20,
		/datum/attribute/skill/craft/cooking = 10,
	)

/datum/attribute_holder/sheet/job/disciple/quarterstaff
	raw_attribute_list = list(
		STAT_PERCEPTION = 1,
		STAT_INTELLIGENCE = 1,
	)
	clamped_adjustment = list(
		/datum/attribute/skill/combat/polearms = list(40, 40)
	)

/datum/job/advclass/sacrestant/disciple
	title = "Disciple"
	tutorial = "Some train their steel, others train their wits. You have honed your body itself into a weapon, anointing it with faithful markings to fortify your soul. You serve and train under the Knightly Chapter, and one day you will be among the most dauntless warriors of the Four and One."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_LESS_DISCRIMINATED
	outfit = /datum/outfit/disciple
	category_tags = list(CTAG_INQUISITION)

	attribute_sheet = /datum/attribute_holder/sheet/job/disciple

	traits = list(
		TRAIT_INQUISITION,
		TRAIT_SILVER_BLESSED,
		TRAIT_STEELHEARTED,
		TRAIT_ANGROSIAN_GRIT,
		TRAIT_ANGROSIAN,
		TRAIT_FOREIGNER,
	)

	languages = list(/datum/language/newunsundered)

/datum/job/advclass/sacrestant/disciple/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	GLOB.inquisition.add_member_to_school(spawned, "Knightly Chapter", 0, "Disciple")

	var/datum/species/species = spawned.dna?.species
	if(species)
		species.native_language = "Old Unsundered"
		species.accent_language = species.get_accent(species.native_language)

/datum/job/advclass/sacrestant/disciple/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	// I Hate
	var/static/list/weapons = list(
		"Discipline - Unarmed" = /obj/item/clothing/gloves/bandages/pugilist,
		"Katar" = /obj/item/weapon/katar/angros,
		"Knuckledusters" = /obj/item/weapon/knuckles/angros,
		"Quarterstaff" = /obj/item/weapon/polearm/woodstaff/quarterstaff/silver,
	)
	var/weapon_choice = spawned.select_equippable(player_client, weapons, message = "TAKE UP ANGROS'S ARMS!")
	spawned.equip_to_slot_or_del(new /obj/item/clothing/gloves/bandages/weighted, ITEM_SLOT_GLOVES, TRUE) // this will fail on the unarmed discipline
	switch(weapon_choice)
		if("Discipline - Unarmed")
			spawned.clamped_adjust_skill_level(/datum/attribute/skill/combat/unarmed, 10, 40)
			ADD_TRAIT(spawned, TRAIT_CRITICAL_RESISTANCE, JOB_TRAIT)
			ADD_TRAIT(spawned, TRAIT_IGNOREDAMAGESLOWDOWN, JOB_TRAIT)
			spawned.add_spell(/datum/action/innate/clench_fists, TRUE)
			ADD_TRAIT(spawned, TRAIT_CLOSECOMBAT, JOB_TRAIT)
		if("Katar")
			spawned.clamped_adjust_skill_level(/datum/attribute/skill/combat/unarmed, 10, 40)
			ADD_TRAIT(spawned, TRAIT_CRITICAL_RESISTANCE, JOB_TRAIT)
		if("Knuckledusters")
			spawned.clamped_adjust_skill_level(/datum/attribute/skill/combat/unarmed, 10, 40)
			ADD_TRAIT(spawned, TRAIT_CRITICAL_RESISTANCE, JOB_TRAIT)
		if("Quarterstaff")
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/disciple/quarterstaff)

/datum/outfit/disciple
	name = "Disciple (Sacrestants)"
	shoes = /obj/item/clothing/shoes/angrosboots
	armor = /obj/item/clothing/armor/regenerating/skin/disciple
	backl = /obj/item/storage/backpack/satchel/otavan
	belt = /obj/item/storage/belt/leather/rope/dark
	pants = /obj/item/clothing/pants/tights/colored/black
	beltl = /obj/item/storage/belt/pouch/coins/mid
	cloak = /obj/item/clothing/cloak/angrostabard/alt
	ring = /obj/item/clothing/ring/signet/silver
	wrists = /obj/item/clothing/wrists/bracers/psythorns
	mask = /obj/item/clothing/head/helmet/blacksteel/psythorns
	head = /obj/item/clothing/head/roguehood/angros
	backpack_contents = list(
		/obj/item/storage/keyring/inquisitor = 1,
		/obj/item/paper/inqslip/arrival/ortho = 1,
		/obj/item/collar_detonator = 1,
	)

/datum/outfit/disciple/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	switch(equipped_human.patron?.type)
		if(/datum/patron/divine/centrist)
			neck = /obj/item/clothing/neck/psycross/silver/divine
		if(/datum/patron/angros)
			neck = /obj/item/clothing/neck/psycross/silver
