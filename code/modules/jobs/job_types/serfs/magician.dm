/datum/attribute_holder/sheet/job/magician
	attribute_variance = list(
		/datum/attribute/skill/magic/arcane = list(0, 10)
	)
	raw_attribute_list = list(
		STAT_STRENGTH = -2,
		STAT_INTELLIGENCE = 5,
		STAT_CONSTITUTION = -2,
		STAT_SPEED = -2,
		/datum/attribute/skill/misc/reading = 60,
		/datum/attribute/skill/misc/riding = 20,
		/datum/attribute/skill/magic/arcane = 50,
		/datum/attribute/skill/combat/wrestling = 10,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/combat/polearms = 30,
		/datum/attribute/skill/craft/alchemy = 30,
		/datum/attribute/skill/labor/mathematics = 40
	)

/datum/attribute_holder/sheet/job/magician/old
	attribute_variance = list(
		/datum/attribute/skill/magic/arcane = list(0, 10)
	)
	raw_attribute_list = list(
		STAT_STRENGTH = -2,
		STAT_INTELLIGENCE = 6,
		STAT_CONSTITUTION = -2,
		STAT_SPEED = -3,
		/datum/attribute/skill/misc/reading = 60,
		/datum/attribute/skill/misc/riding = 20,
		/datum/attribute/skill/magic/arcane = 50,
		/datum/attribute/skill/combat/wrestling = 10,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/combat/polearms = 30,
		/datum/attribute/skill/craft/alchemy = 30,
		/datum/attribute/skill/labor/mathematics = 40
	)

/datum/job/magician
	title = "Tower Archmage"
	alt_titles = list("Archwizard", "High Magician", "High Mage", "Grand Abjurer", "Grand Illusionist", "Grand Wyrd", "Grand Conjurer", "Grand Summoner", "Grand Evocator")
	alt_honorary = list("Archwizard", "Magus", "High Mage", "Proctor", "Headmaster", "Grand Enchanter")
	alt_honorary_female = list("Archwizard", "Magus", "High Mage", "Proctor", "Headmistress", "Grand Enchantress")
	tutorial = "A seer of dreams, a reader of stars, and a master of the arcyne. Along a band of unlikely heroes, you shaped the fate of these lands.\
	Now the days of adventure are gone, replaced by dusty tomes and whispered prophecies. The ruler's coin funds your studies, and your university,\
	but debts both magical and mortal are never so easily repaid. With age comes wisdom, but also the creeping dread that your greatest spell work\
	may already be behind you."
	department_flag = SERFS
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_MAGICIAN
	factions = list(FACTION_TOWN, SUB_FACTION_KEEP)
	total_positions = 2
	spawn_positions = 2
	bypass_lastclass = TRUE
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	blacklisted_species = list(SPEC_ID_HALFLING)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/magician
	give_bank_account = 120
	knows_the_town = TRUE
	known_by_the_town = TRUE
	cmode_music = 'sound/music/cmode/nobility/CombatCourtMagician.ogg'
	magic_user = TRUE
	job_bitflag = BITFLAG_CONSTRUCTOR
	max_apprentices = 2
	honorary = "Archmage"
	book_type = /obj/item/recipe_book/arcyne

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
	)

	form_points = 14
	technique_points = 12

	exp_type = list(EXP_TYPE_ADVENTURER, EXP_TYPE_LIVING, EXP_TYPE_MAGICK)
	exp_types_granted = list(EXP_TYPE_MAGICK, EXP_TYPE_ADVENTURER)
	exp_requirements = list(
		EXP_TYPE_LIVING = 1200,
		EXP_TYPE_ADVENTURER = 300,
		EXP_TYPE_MAGICK = 300
	)

	attribute_sheet = /datum/attribute_holder/sheet/job/magician
	attribute_sheet_old = /datum/attribute_holder/sheet/job/magician/old

	traits = list(
		TRAIT_SEEPRICES,
		TRAIT_OLDPARTY,
		TRAIT_VIRGIN,
	)

/datum/job/magician/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.add_quirk(/datum/quirk/boon/folk_hero)
	if(prob(1))
		spawned.cmode_music = 'sound/music/cmode/antag/combat_evilwizard.ogg'

	if(istype(spawned.patron, /datum/patron/inhumen/archdevils))
		spawned.grant_language(/datum/language/hellspeak)

	if(spawned.gender == MALE && spawned.dna?.species  && spawned.dna.species.id != SPEC_ID_MEDICATOR)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/wizard()

/datum/job/magician/on_roundstart(mob/living/spawned, client/player_client)
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
		"Courtmage Robes" = /obj/item/clothing/shirt/robe/colored/courtmage,
		"Wizard robes" = /obj/item/clothing/shirt/robe/wizard,
	)
	spawned.select_equippable(player_client, selectablerobe, message = "Choose your robe of choice", title = "WIZARD")

	var/static/list/selectable_books = list(
		"Blazing Tome (Fire)" = /obj/item/spellbook/legendary/starter/fire,
		"Frostbound Tome (Ice)" = /obj/item/spellbook/legendary/starter/ice,
		"Storm-Charged Tome (Lightning)" = /obj/item/spellbook/legendary/starter/lightning,
		"Stoneveined Tome (Earth)" = /obj/item/spellbook/legendary/starter/earth,
		"Thrice-Warded Tome (Arcane)" = /obj/item/spellbook/legendary/starter/arcane,
		"Decay-Touched Tome (Entropy)" = /obj/item/spellbook/legendary/starter/death,
		"Verdant Tome (Life)" = /obj/item/spellbook/legendary/starter/life,
		"Windswept Tome (Air)" = /obj/item/spellbook/legendary/starter/air,
		"Tidebound Tome (Water)" = /obj/item/spellbook/legendary/starter/water,
	)

	grant_selected_spellbooks(spawned, selectable_books, 2)

/datum/outfit/magician
	name = JOB_COURT_MAGE
	backr = /obj/item/storage/backpack/satchel
	cloak = /obj/item/clothing/cloak/black_cloak
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/magebag/apprentice
	beltl = /obj/item/storage/belt/pouch/coins/rich
	backl = /obj/item/weapon/polearm/woodstaff
	pants = /obj/item/clothing/pants/tights/colored/random
	shoes = /obj/item/clothing/shoes/shortboots
	neck = /obj/item/clothing/neck/mana_star
	backpack_contents = list(
		/obj/item/scrying = 1,
		/obj/item/chalk = 1,
		/obj/item/reagent_containers/glass/bottle/killersice = 1,
		/obj/item/weapon/knife/dagger/silver/arcyne = 1,
		/obj/item/storage/keyring/mage = 1
	)
