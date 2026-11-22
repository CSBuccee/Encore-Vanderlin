/datum/migrant_role/qadirid/emir
	name = "Qadirid Emir"
	greet_text = "An Emir hailing from Milhun, here on business for the Burning Banner to the throne of Etgard."
	migrant_job = /datum/job/migrant/qadirid_migration/emir

/datum/attribute_holder/sheet/job/migrant/emir
	raw_attribute_list = list(
		STAT_INTELLIGENCE = 1,
		STAT_ENDURANCE = 2,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/misc/riding = 40,
		/datum/attribute/skill/misc/reading = 40,
		/datum/attribute/skill/misc/music = 10,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/craft/cooking = 20,
		/datum/attribute/skill/combat/crossbows = 20,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/labor/mathematics = 30,
	)

/datum/job/migrant/qadirid_migration/emir
	title = "Qadirid Emir"
	outfit = /datum/outfit/qadirid_migration/emir
	allowed_sexes = list(MALE)
	allowed_races = RACES_PLAYER_SULTANS
	is_recognized = TRUE
	honorary = "Emir"
	honorary_f = "Amirah"

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/emir

	spells = list(
		/datum/action/cooldown/spell/undirected/call_bird/qadirid
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_NOBLE_BLOOD,
		TRAIT_NOBLE_POWER,
	)

	languages = list(/datum/language/qadirid)
	cmode_music = 'sound/music/cmode/adventurer/CombatOutlander.ogg'

/datum/job/migrant/qadirid_migration/emir/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	if(spawned.dna?.species)
		if(spawned.dna.species.id == SPEC_ID_HUMEN)
			spawned.dna.species.native_language = "Qadirid"
			spawned.dna.species.accent_language = spawned.dna.species.get_accent(spawned.dna.species.native_language)
		if(spawned.dna.species.id == SPEC_ID_HALF_ELF && spawned.dna.species.native_language == "Common")
			spawned.dna.species.native_language = "Qadirid"
			spawned.dna.species.accent_language = spawned.dna.species.get_accent(spawned.dna.species.native_language)

/datum/outfit/qadirid_migration/emir
	name = "Qadirid Emir (Migrant Wave)"
	shoes = /obj/item/clothing/shoes/shalal
	gloves = /obj/item/clothing/gloves/leather
	head = /obj/item/clothing/head/crown/circlet
	cloak = /obj/item/clothing/cloak/raincloak/colored/purple
	armor = /obj/item/clothing/armor/gambeson/arming
	belt = /obj/item/storage/belt/leather/shalal
	beltl = /obj/item/weapon/sword/sabre/shalal
	beltr = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/satchel
	ring = /obj/item/clothing/ring/gold/guild_mercator
	shirt = /obj/item/clothing/shirt/tunic/colored/purple
	pants = /obj/item/clothing/pants/trou/leather
	neck = /obj/item/clothing/neck/shalal/emir
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/veryrich)

/datum/outfit/qadirid_migration/emir/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()

	if(equipped_human.gender == FEMALE)
		armor = /obj/item/clothing/armor/leather/jacket/silk_coat
		shirt = /obj/item/clothing/shirt/dress/silkdress/colored/black

/datum/migrant_role/qadirid/amirah
	name = "Qadirid Amirah"
	greet_text = "An Amirah hailing from Milhun, here on business for the Burning Banner to the throne of Etgard."
	migrant_job = /datum/job/migrant/qadirid_migration/amirah

/datum/attribute_holder/sheet/job/migrant/amirah
	raw_attribute_list = list(
		STAT_INTELLIGENCE = 1,
		STAT_ENDURANCE = 2,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/misc/riding = 40,
		/datum/attribute/skill/misc/reading = 40,
		/datum/attribute/skill/misc/music = 10,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/craft/cooking = 20,
		/datum/attribute/skill/combat/crossbows = 20,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/labor/mathematics = 30,
	)

/datum/job/migrant/qadirid_migration/amirah
	title = "Qadirid Amirah"
	outfit = /datum/outfit/qadirid_migration/amirah
	allowed_sexes = list(FEMALE)
	allowed_races = RACES_PLAYER_SULTANS
	is_recognized = TRUE

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/amirah

	honorary = "Emir"
	honorary_f = "Amirah"

	spells = list(
		/datum/action/cooldown/spell/undirected/call_bird/qadirid
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_NOBLE_BLOOD,
		TRAIT_NOBLE_POWER,
	)

	languages = list(/datum/language/qadirid)
	cmode_music = 'sound/music/cmode/adventurer/CombatOutlander.ogg'

/datum/job/migrant/qadirid_migration/amirah/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(spawned.dna?.species)
		if(spawned.dna.species.id == SPEC_ID_HUMEN)
			spawned.dna.species.native_language = "Qadirid"
			spawned.dna.species.accent_language = spawned.dna.species.get_accent(spawned.dna.species.native_language)
		if(spawned.dna.species.id == SPEC_ID_HALF_ELF && spawned.dna.species.native_language == "Common")
			spawned.dna.species.native_language = "Qadirid"
			spawned.dna.species.accent_language = spawned.dna.species.get_accent(spawned.dna.species.native_language)

/datum/outfit/qadirid_migration/amirah
	name = "Qadirid Amirah (Migrant Wave)"
	shoes = /obj/item/clothing/shoes/shalal
	gloves = /obj/item/clothing/gloves/leather
	head = /obj/item/clothing/head/crown/nyle
	cloak = /obj/item/clothing/cloak/raincloak/colored/purple
	armor = /obj/item/clothing/armor/leather/jacket/silk_coat
	belt = /obj/item/storage/belt/leather/shalal
	beltl = /obj/item/weapon/sword/sabre/shalal
	beltr = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/satchel
	ring = /obj/item/clothing/ring/gold/guild_mercator
	shirt = /obj/item/clothing/shirt/dress/silkdress/colored/black
	pants = /obj/item/clothing/pants/trou/leather
	neck = /obj/item/clothing/neck/shalal/emir
	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/veryrich = 1,
		/obj/item/reagent_containers/glass/bottle/wine = 1,
	)

/datum/migrant_role/qadirid/furusiyya
	name = "Furusiyya"
	greet_text = "You are a furusiyya, pledged to the Emir and the Amirah. Make sure they come out alive of that place."
	migrant_job = /datum/job/migrant/qadirid_migration/furusiyya

/datum/attribute_holder/sheet/job/migrant/furusiyya
	raw_attribute_list = list(
		STAT_STRENGTH = 3,
		STAT_PERCEPTION = 1,
		STAT_INTELLIGENCE = 2,
		STAT_CONSTITUTION = 2,
		STAT_ENDURANCE = 2,
		STAT_SPEED = -1,
		/datum/attribute/skill/combat/polearms = 40,
		/datum/attribute/skill/combat/swords = 40,
		/datum/attribute/skill/combat/whipsflails = 40,
		/datum/attribute/skill/combat/axesmaces = 40,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 40,
		/datum/attribute/skill/combat/crossbows = 30,
		/datum/attribute/skill/combat/bows = 30,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/misc/riding = 40,
		/datum/attribute/skill/labor/mathematics = 30,
	)

/datum/job/migrant/qadirid_migration/furusiyya
	title = "Furusiyya"
	outfit = /datum/outfit/qadirid_migration/furusiyya
	allowed_sexes = list(MALE)
	allowed_races = RACES_PLAYER_SULTANS
	is_recognized = TRUE
	exp_types_granted  = list(EXP_TYPE_COMBAT)

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/furusiyya

	traits = list(
		TRAIT_NOBLE_BLOOD,
		TRAIT_NOBLE_POWER,
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
		TRAIT_STEELHEARTED,
	)

	languages = list(/datum/language/qadirid)
	cmode_music = 'sound/music/cmode/adventurer/CombatOutlander.ogg'

/datum/job/migrant/qadirid_migration/furusiyya/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	if(spawned.dna?.species)
		if(spawned.dna.species.id == SPEC_ID_HUMEN)
			spawned.dna.species.native_language = "Qadirid"
			spawned.dna.species.accent_language = spawned.dna.species.get_accent(spawned.dna.species.native_language)
		if(spawned.dna.species.id == SPEC_ID_HALF_ELF && spawned.dna.species.native_language == "Common")
			spawned.dna.species.native_language = "Qadirid"
			spawned.dna.species.accent_language = spawned.dna.species.get_accent(spawned.dna.species.native_language)

/datum/outfit/qadirid_migration/furusiyya
	name = "Furusiyya (Migrant Wave)"
	pants = /obj/item/clothing/pants/tights/colored/black
	beltl = /obj/item/storage/belt/pouch/coins/mid
	shoes = /obj/item/clothing/shoes/boots/rare/qadiridplate
	gloves = /obj/item/clothing/gloves/rare/qadiridplate
	belt = /obj/item/storage/belt/leather/shalal
	shirt = /obj/item/clothing/shirt/undershirt/colored/random
	armor = /obj/item/clothing/armor/rare/qadiridplate
	backl = /obj/item/storage/backpack/satchel
	head = /obj/item/clothing/head/rare/qadiridplate
	wrists = /obj/item/clothing/wrists/bracers
	neck = /obj/item/clothing/neck/chaincoif

/datum/outfit/qadirid_migration/furusiyya/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()

	var/randy = rand(1,5)
	switch(randy)
		if(1 to 2)
			backr = /obj/item/weapon/polearm/halberd/bardiche
		if(3 to 4)
			backr = /obj/item/weapon/polearm/eaglebeak
		if(5)
			backr = /obj/item/weapon/polearm/spear/billhook

/datum/migrant_role/qadirid_guard
	name = "Qadirid Soldier"
	greet_text = "You are a soldier from Milhun, sent as an escort to the emirs on a foreign land, do not fail them."
	migrant_job = /datum/job/migrant/qadirid_migration/qadirid_guard

/datum/attribute_holder/sheet/job/migrant/qadirid_guard
	attribute_variance = list(
		/datum/attribute/skill/combat/shields = list(0, 10)
	)
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		STAT_ENDURANCE = 2,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/misc/sneaking = 30,
		/datum/attribute/skill/misc/lockpicking = 10,
		/datum/attribute/skill/combat/axesmaces = 20,
		/datum/attribute/skill/combat/bows = 20,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/combat/polearms = 10,
		/datum/attribute/skill/combat/whipsflails = 10,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/misc/athletics = 30,
	)

/datum/job/migrant/qadirid_migration/qadirid_guard
	title = "Qadirid Soldier"
	outfit = /datum/outfit/qadirid_migration/qadirid_guard
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_PLAYER_ALL
	exp_types_granted  = list(EXP_TYPE_COMBAT)

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/qadirid_guard

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
	)
	languages = list(/datum/language/qadirid)
	cmode_music = 'sound/music/cmode/adventurer/CombatOutlander.ogg'

/datum/job/migrant/qadirid_migration/qadirid_guard/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	if(spawned.dna?.species)
		if(spawned.dna.species.id == SPEC_ID_HUMEN)
			spawned.dna.species.native_language = "Qadirid"
			spawned.dna.species.accent_language = spawned.dna.species.get_accent(spawned.dna.species.native_language)
		if(spawned.dna.species.id == SPEC_ID_HALF_ELF && spawned.dna.species.native_language == "Common")
			spawned.dna.species.native_language = "Qadirid"
			spawned.dna.species.accent_language = spawned.dna.species.get_accent(spawned.dna.species.native_language)

/datum/outfit/qadirid_migration/qadirid_guard
	name = "Qadirid Soldier (Migrant Wave)"
	shoes = /obj/item/clothing/shoes/shalal
	head = /obj/item/clothing/head/helmet/kettle/qadirid
	gloves = /obj/item/clothing/gloves/angle
	belt = /obj/item/storage/belt/leather/shalal
	armor = /obj/item/clothing/armor/brigandine/coatplates
	beltr = /obj/item/weapon/sword/long/rider
	beltl = /obj/item/flashlight/flare/torch/lantern
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	pants = /obj/item/clothing/pants/tights/colored/red
	neck = /obj/item/clothing/neck/keffiyeh/colored/red
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor)

/datum/migrant_role/qatil
	name = "Qatil"
	greet_text = "You are the Amirah's confident and most loyal protector, you shan't let them die in these wretched lands."
	migrant_job = /datum/job/migrant/qadirid_migration/qatil

/datum/attribute_holder/sheet/job/migrant/qatil
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		STAT_SPEED = 2,
		STAT_ENDURANCE = 1,
		/datum/attribute/skill/combat/knives = 40,
		/datum/attribute/skill/combat/swords = 20,
		/datum/attribute/skill/combat/crossbows = 20,
		/datum/attribute/skill/combat/bows = 20,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/misc/climbing = 40,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/misc/sneaking = 40,
		/datum/attribute/skill/misc/stealing = 20,
		/datum/attribute/skill/misc/lockpicking = 30,
		/datum/attribute/skill/craft/traps = 10,
	)

/datum/job/migrant/qadirid_migration/qatil
	title = "Qatil"
	outfit = /datum/outfit/qadirid_migration/qatil
	exp_types_granted  = list(EXP_TYPE_COMBAT)
	allowed_races = list(
		SPEC_ID_HUMEN,
		SPEC_ID_ELF,
		SPEC_ID_RAKSHARI,
		SPEC_ID_HALF_ELF,
		SPEC_ID_TIEFLING,
		SPEC_ID_DROW,
		SPEC_ID_HALF_DROW,
	)

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/qatil

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_STEELHEARTED,
	)
	languages = list(/datum/language/qadirid)
	cmode_music = 'sound/music/cmode/adventurer/CombatOutlander3.ogg'

/datum/job/migrant/qadirid_migration/qatil/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	if(spawned.dna?.species)
		if(spawned.dna.species.id == SPEC_ID_HUMEN)
			spawned.dna.species.native_language = "Qadirid"
			spawned.dna.species.accent_language = spawned.dna.species.get_accent(spawned.dna.species.native_language)
		if(spawned.dna.species.id == SPEC_ID_HALF_ELF && spawned.dna.species.native_language == "Common")
			spawned.dna.species.native_language = "Qadirid"
			spawned.dna.species.accent_language = spawned.dna.species.get_accent(spawned.dna.species.native_language)

/datum/outfit/qadirid_migration/qatil
	name = "Qatil (Migrant Wave)"
	pants = /obj/item/clothing/pants/trou/leather
	beltr = /obj/item/weapon/knife/dagger/steel/special
	shoes = /obj/item/clothing/shoes/shalal
	gloves = /obj/item/clothing/gloves/angle
	belt = /obj/item/storage/belt/leather/shalal
	shirt = /obj/item/clothing/shirt/undershirt/colored/red
	armor = /obj/item/clothing/armor/leather/splint
	backl = /obj/item/storage/backpack/satchel
	head = /obj/item/clothing/neck/keffiyeh/colored/red
	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/poor,
		/obj/item/lockpick,
	)

/datum/migrant_wave/qadirid_wave
	name = "The Sultanate Expedition"
	max_spawns = 1
	shared_wave_type = list(/datum/migrant_wave/aelondan_visit,/datum/migrant_wave/qadirid_wave,/datum/migrant_wave/rockhill_wave,/datum/migrant_wave/dunmoon)
	weight = 25
	downgrade_wave = /datum/migrant_wave/qadirid_wave_down
	roles = list(
		/datum/migrant_role/qadirid/emir = 1,
		/datum/migrant_role/qadirid/amirah = 1,
		/datum/migrant_role/qadirid/furusiyya = 1,
		/datum/migrant_role/qatil = 1,
		/datum/migrant_role/qadirid_guard = 2
	)
	greet_text = "The Burning Banner sent you, respected Sunmen, to seek favorable business proposals upon Domotan Island."

/datum/migrant_wave/qadirid_wave_down
	name = "The Sultanate Expedition"
	max_spawns = 1
	shared_wave_type = list(/datum/migrant_wave/aelondan_visit,/datum/migrant_wave/qadirid_wave,/datum/migrant_wave/rockhill_wave,/datum/migrant_wave/dunmoon)
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/qadirid/emir = 1,
		/datum/migrant_role/qadirid/amirah = 1,
		/datum/migrant_role/qadirid/furusiyya = 1,
		/datum/migrant_role/qatil = 1
	)
	greet_text = "The Burning Banner sent you, respected Sunmen, to seek favorable business proposals upon Domotan Island. Unfortunately most of your guards died on the way here."
