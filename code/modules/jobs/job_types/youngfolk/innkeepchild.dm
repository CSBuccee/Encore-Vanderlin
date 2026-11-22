/datum/attribute_holder/sheet/job/innkeep_son
	raw_attribute_list = list(
		STAT_ENDURANCE = 1,
		STAT_STRENGTH = -1,
		STAT_CONSTITUTION = -1,
		/datum/attribute/skill/combat/wrestling = 10,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/craft/cooking = 20,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/misc/medicine = 10,
		/datum/attribute/skill/misc/stealing = 10,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 10
	)

/datum/job/innkeep_son
	title = JOB_INNKEEP_SON
	f_title = "Tavern Assistant"
	tutorial = "One of the Innkeeper's assistants; you're the lowest rung on the ladder in their business venture. Clean floors and cutlery, fetch ingredients and casks; whatever the rest of the staff ask of you. You might even pour a drink or two if they're too busy; whatever needs doing."
	department_flag = YOUNGFOLK
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_INNKEEP_CHILD
	factions = list(FACTION_TOWN)
	total_positions = 99
	spawn_positions = 99
	bypass_lastclass = TRUE

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = RACES_NON_ANTAG
	knows_the_town = TRUE
	known_by_the_town = TRUE

	outfit = /datum/outfit/innkeep_son
	can_have_apprentices = FALSE
	can_be_apprentice = TRUE
	cmode_music = 'sound/music/cmode/towner/CombatInn.ogg'

	traits = list(
		TRAIT_INGREDIENT_INSIGHT
	)

	job_bitflag = BITFLAG_CONSTRUCTOR

	attribute_sheet = /datum/attribute_holder/sheet/job/innkeep_son
	book_type = /obj/item/recipe_book/cooking

/datum/outfit/innkeep_son
	name = JOB_INNKEEP_SON
	pants = /obj/item/clothing/pants/tights/colored/random
	shirt = /obj/item/clothing/shirt/shortshirt/colored/random
	shoes = /obj/item/clothing/shoes/shortboots
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/belt/pouch/coins/poor
	neck = /obj/item/storage/keyring/innkeep

/datum/outfit/innkeep_son/pre_equip(mob/living/carbon/human/equipped_human)
	. = ..()
	if(equipped_human.gender == MALE)
		cloak = /obj/item/clothing/cloak/apron/waist
	else
		armor = /obj/item/clothing/shirt/dress
