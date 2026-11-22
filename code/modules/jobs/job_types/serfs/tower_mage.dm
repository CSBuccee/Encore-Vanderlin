/datum/attribute_holder/sheet/job/tower_mage
	attribute_variance = list(
		/datum/attribute/skill/magic/arcane = list(0, 10)
	)
	raw_attribute_list = list(
		STAT_STRENGTH = -1,
		STAT_INTELLIGENCE = 3,
		STAT_CONSTITUTION = -1,
		STAT_SPEED = -1,
		/datum/attribute/skill/misc/reading = 50,
		/datum/attribute/skill/magic/arcane = 40,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/combat/polearms = 20,
		/datum/attribute/skill/craft/alchemy = 20,
		/datum/attribute/skill/labor/mathematics = 40
	)

/datum/attribute_holder/sheet/job/tower_mage/old
	attribute_variance = list(
		/datum/attribute/skill/magic/arcane = list(0, 10)
	)
	raw_attribute_list = list(
		STAT_STRENGTH = -1,
		STAT_INTELLIGENCE = 4,
		STAT_CONSTITUTION = -1,
		STAT_SPEED = -2,
		/datum/attribute/skill/misc/reading = 60,
		/datum/attribute/skill/magic/arcane = 50,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/combat/polearms = 30,
		/datum/attribute/skill/craft/alchemy = 30,
		/datum/attribute/skill/labor/mathematics = 40
	)

/datum/job/tower_mage
	title = "Tower Magician"
	alt_titles = list("Magician", "Mage", "Abjurer", "Illusionist", "Wyrd", "Conjurer", "Wizard", "Summoner", "Evocator", "Sorcerer")
	alt_honorary = list("Professor", "Tutor", "Enchanter", "Sorcerer")
	alt_honorary_female = list("Professor", "Tutor", "Enchantress", "Sorceress")
	tutorial = "Endless days and nights of studying have finally paid off - you graduated from your apprenticeship, at long last!\
	The arcyne is finally your own to command without constant supervision by the Archmagi. Now, you've been granted a measure of freedom to\
	pursue your own research, although you still answer to them... To make matters worse, now the beady-eyed apprentices are also looking to you for guidance!\
	Didn't you just graduate yesterday? Oh, Gods... well, maybe just ONE apprentice is manageable..."
	department_flag = SERFS
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_TOWER_MAGE
	factions = FACTION_TOWN
	total_positions = 99
	spawn_positions = 99
	bypass_lastclass = TRUE
	allowed_races = RACES_NON_ANTAG
	blacklisted_species = list(SPEC_ID_HALFLING)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/tower_mage
	cmode_music = 'sound/music/cmode/nobility/CombatCourtMagician.ogg'
	magic_user = TRUE
	job_bitflag = BITFLAG_CONSTRUCTOR
	max_apprentices = 1
	book_type = /obj/item/recipe_book/arcyne

	form_points = 8
	technique_points = 8

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
	)

	exp_type = list(EXP_TYPE_ADVENTURER, EXP_TYPE_LIVING, EXP_TYPE_MAGICK)
	exp_types_granted = list(EXP_TYPE_MAGICK, EXP_TYPE_ADVENTURER)
	exp_requirements = list(
		EXP_TYPE_LIVING = 900,
		EXP_TYPE_ADVENTURER = 300,
		EXP_TYPE_MAGICK = 300
	)

	attribute_sheet = /datum/attribute_holder/sheet/job/tower_mage
	attribute_sheet_old = /datum/attribute_holder/sheet/job/tower_mage/old

	traits = list(
		TRAIT_SEEPRICES,
		TRAIT_VIRGIN,
	)

/datum/job/tower_mage/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(prob(1))
		spawned.cmode_music = 'sound/music/cmode/antag/combat_evilwizard.ogg'

	if(istype(spawned.patron, /datum/patron/inhumen/archdevils))
		spawned.grant_language(/datum/language/hellspeak)

	if(spawned.gender == MALE && spawned.dna?.species  && spawned.dna.species.id != SPEC_ID_MEDICATOR)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/wizard()

/datum/outfit/tower_mage
	name = "Tower Magician"
	backr = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/magebag/apprentice
	beltl = /obj/item/storage/belt/pouch/coins/mid
	backl = /obj/item/weapon/polearm/woodstaff
	shoes = /obj/item/clothing/shoes/shortboots
	backpack_contents = list(
		/obj/item/chalk = 1,
		/obj/item/weapon/knife/dagger/silver/arcyne = 1,
		/obj/item/storage/keyring/mageapprentice = 1,
		/obj/item/key/tower,
	)

/datum/job/tower_mage/on_roundstart(mob/living/spawned, client/player_client)
	. = ..()

	var/static/list/selectablehat = list(
		"Witch hat" = /obj/item/clothing/head/wizhat/witch,
		"Random Wizard hat" = /obj/item/clothing/head/wizhat/random,
		"Mage hood" = /obj/item/clothing/head/roguehood/colored/mage,
		"Generic Wizard hat" = /obj/item/clothing/head/wizhat/gen,
		"Black hood" = /obj/item/clothing/head/roguehood/colored/black,
	)
	spawned.select_equippable(player_client, selectablehat, message = "Choose your hat of choice", title = "WIZARD")

	var/static/list/selectablerobe = list(
		"Black robes" = /obj/item/clothing/shirt/robe/colored/black,
		"Mage robes" = /obj/item/clothing/shirt/robe/colored/mage,
		"Wizard robes" = /obj/item/clothing/shirt/robe/wizard,
	)
	spawned.select_equippable(player_client, selectablerobe, message = "Choose your robe of choice", title = "WIZARD")

	var/static/list/selectable_books = list(
		"Blazing Tome (Fire)" = /obj/item/spellbook/expert/starter/fire,
		"Frostbound Tome (Ice)" = /obj/item/spellbook/expert/starter/ice,
		"Storm-Charged Tome (Lightning)" = /obj/item/spellbook/expert/starter/lightning,
		"Stoneveined Tome (Earth)" = /obj/item/spellbook/expert/starter/earth,
		"Thrice-Warded Tome (Arcane)" = /obj/item/spellbook/expert/starter/arcane,
		"Decay-Touched Tome (Entropy)" = /obj/item/spellbook/expert/starter/death,
		"Verdant Tome (Life)" = /obj/item/spellbook/expert/starter/life,
		"Windswept Tome (Air)" = /obj/item/spellbook/expert/starter/air,
		"Tidebound Tome (Water)" = /obj/item/spellbook/expert/starter/water,
	)

	grant_selected_spellbooks(spawned, selectable_books, 2)

