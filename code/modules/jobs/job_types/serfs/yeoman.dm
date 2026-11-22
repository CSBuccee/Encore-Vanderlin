/datum/job/yeoman
	title = JOB_YEOMAN
	tutorial = "An ordinary townsperson of Domotan Isle. You live here, or are here in a transitionary period, and you live your days doing the dirty work. Farming, smithing, weaving, and many more all fall under your purview."
	department_flag = SERFS
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_YEOMAN
	factions = list(FACTION_TOWN)
	total_positions = 99
	spawn_positions = 99
	bypass_lastclass = TRUE
	knows_the_town = TRUE
	known_by_the_town = TRUE
	give_bank_account = TRUE
	advclass_cat_rolls = list(CTAG_YEOMAN = 20)
	cmode_music = 'sound/music/cmode/towner/CombatTowner.ogg'
	job_bitflag = BITFLAG_CONSTRUCTOR
	give_bank_account = 200//To rent their workplace at least once a round
	max_apprentices = 2

/datum/job/advclass/yeoman
	factions = list(FACTION_TOWN)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = RACES_NON_ANTAG

/datum/job/advclass/yeoman/handmason
	title = "Handmason"
	tutorial = "A worker of wood and stone, of carpentry and masonry. You build homes, barns, towns, keeps. Nothing that lasts stands without stubborn souls like you."
	outfit = /datum/outfit/yeoman/handmason
	category_tags = list(CTAG_YEOMAN)
	attribute_sheet = /datum/attribute_holder/sheet/job/yeoman/handmason
	book_type = /obj/item/recipe_book/masonry

/datum/outfit/yeoman/handmason
	name = "Handmason"
	pants = /obj/item/clothing/pants/tights/colored/random
	shirt = /obj/item/clothing/shirt/undershirt/colored
	armor = /obj/item/clothing/armor/leather/vest/colored
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/weapon/hammer
	beltr = /obj/item/weapon/chisel
	neck = /obj/item/storage/belt/pouch/coins/poor
	backl = /obj/item/storage/backpack/backpack
	backr = /obj/item/weapon/axe/iron
	backpack_contents = list(
		/obj/item/natural/feather,
		/obj/item/paper,
		/obj/item/recipe_book/carpentry,
		/obj/item/recipe_book/masonry,
		/obj/item/weapon/knife/villager,
		/obj/item/key/yeoman,
	)

/datum/attribute_holder/sheet/job/yeoman/handmason
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		STAT_PERCEPTION = -1,
		STAT_ENDURANCE = 1,
		STAT_FORTUNE = 1,
		STAT_SPEED = -1,

		/datum/attribute/skill/combat/axesmaces = 20,
		/datum/attribute/skill/labor/mining = 30,
		/datum/attribute/skill/combat/wrestling = 10,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/craft/crafting = 30,
		/datum/attribute/skill/craft/masonry = 40,
		/datum/attribute/skill/craft/engineering = 10,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 30,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/misc/medicine = 10,
		/datum/attribute/skill/craft/cooking = 10,
		/datum/attribute/skill/craft/carpentry = 50,
		/datum/attribute/skill/misc/sewing = 10,
		/datum/attribute/skill/labor/lumberjacking = 30,
	)



/datum/job/advclass/yeoman/tinker
	title = "Tinker"
	tutorial = "An engineer, an inventor, a miner and a smith. You work in a smithy making art of the forge. You work with the wonders of Truetech or Thaumatech and unleash upon the world your creations."
	outfit = /datum/outfit/yeoman/tinker
	category_tags = list(CTAG_YEOMAN)
	attribute_sheet = /datum/attribute_holder/sheet/job/yeoman/tinker
	book_type = /obj/item/recipe_book/engineering
	traits = list(
		TRAIT_SEEPRICES
	)

/datum/outfit/yeoman/tinker
	name = "Tinker"
	head = /obj/item/clothing/head/articap
	armor = /obj/item/clothing/armor/leather/jacket/artijacket
	pants = /obj/item/clothing/pants/trou/artipants
	shirt = /obj/item/clothing/shirt/undershirt/artificer
	shoes = /obj/item/clothing/shoes/simpleshoes/buckle
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/hip/orebag
	beltl = /obj/item/weapon/pick
	mask = /obj/item/clothing/face/goggles
	neck = /obj/item/storage/belt/pouch/coins/mid
	backl = /obj/item/storage/backpack/backpack
	backpack_contents = list(
		/obj/item/weapon/tongs,
		/obj/item/weapon/hammer/steel,
		/obj/item/ore/coal = 2,
		/obj/item/ore/iron = 3,
		/obj/item/recipe_book/blacksmithing,
		/obj/item/recipe_book/engineering,
		/obj/item/flint,
		/obj/item/weapon/knife/villager,
		/obj/item/needle,
		/obj/item/flashlight/flare/torch/lantern,
		/obj/item/key/yeoman,
	)
	ring = /obj/item/clothing/ring/silver/makers_guild

/datum/attribute_holder/sheet/job/yeoman/tinker
	raw_attribute_list = list(
		STAT_INTELLIGENCE = 1,
		STAT_CONSTITUTION = 1,
		STAT_FORTUNE = 1,
		STAT_SPEED = -1,

		/datum/attribute/skill/combat/axesmaces = 20,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/combat/wrestling = 10,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/craft/crafting = 30,
		/datum/attribute/skill/craft/blacksmithing = 40,
		/datum/attribute/skill/craft/armorsmithing = 40,
		/datum/attribute/skill/craft/weaponsmithing = 40,
		/datum/attribute/skill/craft/smelting = 30,
		/datum/attribute/skill/craft/traps = 20,
		/datum/attribute/skill/misc/reading = 20,
		/datum/attribute/skill/labor/mathematics = 20,
		/datum/attribute/skill/craft/masonry = 30,
		/datum/attribute/skill/craft/engineering = 40,
		/datum/attribute/skill/misc/lockpicking = 30,
		/datum/attribute/skill/misc/swimming = 10,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/labor/mining = 30,
		/datum/attribute/skill/craft/bombs = 30,
		/datum/attribute/skill/craft/masonry = 10,
		/datum/attribute/skill/craft/carpentry = 10,
	)




/datum/job/advclass/yeoman/weaver
	title = "Weaver"
	tutorial = "A tailor, a leather-worker, and a bandagemaker. Everything of cloth, wool, leather, fur and silk is of your domain and without you the denizens of Doma would be stark naked."
	outfit = /datum/outfit/yeoman/weaver
	category_tags = list(CTAG_YEOMAN)
	attribute_sheet = /datum/attribute_holder/sheet/job/yeoman/weaver
	book_type = /obj/item/recipe_book/sewing
	traits = list(
		TRAIT_SEEPRICES
	)

/datum/outfit/yeoman/weaver
	name = "Weaver"
	pants = /obj/item/clothing/pants/tights/colored/random
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	shirt = /obj/item/clothing/shirt/tunic/colored
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/weapon/hammer
	beltr = /obj/item/weapon/knife/scissors
	neck = /obj/item/storage/belt/pouch/coins/poor
	backl = /obj/item/storage/backpack/backpack
	backr = /obj/item/storage/backpack/satchel
	backpack_contents = list(
		/obj/item/needle = 1,
		/obj/item/natural/bundle/cloth/full = 2,
		/obj/item/natural/bundle/fibers/full = 2,
		/obj/item/dye_pack/luxury = 1,
		/obj/item/recipe_book/sewing_leather = 1,
		/obj/item/weapon/knife/villager = 1,
		/obj/item/recipe_book/sewing = 1,
		/obj/item/key/yeoman,
		/obj/item/natural/bundle/silk = 2,
		/obj/item/natural/bundle/curred_hide = 1,
	)


/datum/attribute_holder/sheet/job/yeoman/weaver
	raw_attribute_list = list(
		STAT_CONSTITUTION = 1,
		STAT_INTELLIGENCE = 2,
		STAT_FORTUNE = 1,

		/datum/attribute/skill/misc/sewing = 50,
		/datum/attribute/skill/craft/tanning = 40,
		/datum/attribute/skill/craft/crafting = 30,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/misc/sneaking = 20,
		/datum/attribute/skill/labor/taming = 30,
		/datum/attribute/skill/misc/medicine = 20,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/misc/stealing = 10,
		/datum/attribute/skill/labor/mathematics = 20,
		/datum/attribute/skill/craft/masonry = 10,
		/datum/attribute/skill/craft/carpentry = 10,
	)





/datum/job/advclass/yeoman/homesteader
	title = "Homesteader"
	tutorial = "A farmer, a butcher, a vintner and a cook. You toil to feed the realm and to manage your home. Without you, survival is impossible."
	outfit = /datum/outfit/yeoman/homesteader
	category_tags = list(CTAG_YEOMAN)
	attribute_sheet = /datum/attribute_holder/sheet/job/yeoman/homesteader
	book_type = /obj/item/recipe_book/cooking
	traits = list(
		TRAIT_DEADNOSE,
		TRAIT_SEEDKNOW
	)

/datum/outfit/yeoman/homesteader
	name = "Homesteader"
	pants = /obj/item/clothing/pants/tights/colored/random
	shirt = /obj/item/clothing/shirt/undershirt/colored
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather/cloth
	beltl = /obj/item/weapon/knife/cleaver
	r_hand = /obj/item/weapon/shovel
	neck = /obj/item/storage/belt/pouch/coins/poor
	backl = /obj/item/storage/backpack/backpack
	backr = /obj/item/weapon/hoe
	backpack_contents = list(
		/obj/item/neuFarm/seed/wheat = 3,
		/obj/item/neuFarm/seed/potato = 3,
		/obj/item/recipe_book/agriculture,
		/obj/item/recipe_book/cooking,
		/obj/item/needle,
		/obj/item/key/yeoman,
	)

/datum/attribute_holder/sheet/job/yeoman/homesteader
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		STAT_ENDURANCE = 2,
		STAT_FORTUNE = 1,

		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/misc/reading = 20,
		/datum/attribute/skill/craft/cooking = 50,
		/datum/attribute/skill/misc/medicine = 10,
		/datum/attribute/skill/labor/mathematics = 20,
		/datum/attribute/skill/labor/butchering = 30,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/combat/whipsflails = 10,
		/datum/attribute/skill/craft/crafting = 20,
		/datum/attribute/skill/misc/sewing = 10,
		/datum/attribute/skill/labor/farming = 40,
		/datum/attribute/skill/labor/taming = 50,
		/datum/attribute/skill/craft/cooking/brewing = 30,
		/datum/attribute/skill/craft/cooking/winemaking = 30,
		/datum/attribute/skill/craft/cooking/distilling = 30,
		/datum/attribute/skill/craft/cooking/cheesemaking = 30,
		/datum/attribute/skill/craft/carpentry = 10,
		/datum/attribute/skill/craft/tanning = 10,
		/datum/attribute/skill/misc/riding = 10,
		/datum/attribute/skill/craft/masonry = 10,
		/datum/attribute/skill/craft/alchemy = 15,
	)



/datum/job/advclass/yeoman/woodsman
	title = "Woodsman"
	tutorial = "A lumberjack, a carpenter, a hunter and a survivalist. You are an expert of the wilds, one who knows exactly how to squeeze everything you can from the reaches of the island. Without you, the bounties of Nature are out of reach."
	outfit = /datum/outfit/yeoman/woodsman
	category_tags = list(CTAG_YEOMAN)
	attribute_sheet = /datum/attribute_holder/sheet/job/yeoman/woodsman
	book_type = /obj/item/recipe_book/survival
	traits = list(
		TRAIT_FORAGER
	)

/datum/outfit/yeoman/woodsman
	name = "Woodsman"
	pants = /obj/item/clothing/pants/tights/colored/random
	shirt = /obj/item/clothing/shirt/shortshirt/colored/random
	shoes = /obj/item/clothing/shoes/boots/leather
	neck = /obj/item/storage/belt/pouch/coins/poor
	head = /obj/item/clothing/head/brimmed
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/brown
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/gun/ballistic/bow
	r_hand =/obj/item/fishingrod/fisher
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/ammo_holder/quiver/arrows
	beltl = /obj/item/storage/meatbag
	gloves = /obj/item/clothing/gloves/leather
	backpack_contents = list(
		/obj/item/reagent_containers/powder/salt = 1,
		/obj/item/flint = 1,
		/obj/item/bait = 1,
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/flashlight/flare/torch/lantern = 1,
		/obj/item/key/yeoman,
		/obj/item/needle,
		/obj/item/recipe_book/sewing_leather = 1,
	)

/datum/attribute_holder/sheet/job/yeoman/woodsman
	raw_attribute_list = list(
		STAT_PERCEPTION = 2,
		STAT_CONSTITUTION = 1,
		STAT_SPEED = 1,

		/datum/attribute/skill/craft/crafting = 30,
		/datum/attribute/skill/craft/tanning = 30,
		/datum/attribute/skill/combat/bows = 40,
		/datum/attribute/skill/combat/crossbows = 20,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/craft/cooking = 10,
		/datum/attribute/skill/labor/butchering = 20,
		/datum/attribute/skill/labor/taming = 30,
		/datum/attribute/skill/misc/medicine = 10,
		/datum/attribute/skill/misc/sewing = 10,
		/datum/attribute/skill/misc/sneaking = 20,
		/datum/attribute/skill/craft/traps = 40,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/misc/swimming = 10,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/labor/fishing = 40,
		/datum/attribute/skill/craft/masonry = 10,
		/datum/attribute/skill/craft/carpentry = 10,
	)




