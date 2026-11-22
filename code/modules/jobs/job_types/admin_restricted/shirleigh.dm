//Encore special roles
//These are for the Shirleigh king and queen and their henchmen
/datum/attribute_holder/sheet/job/shirleigh_queen
	raw_attribute_list = list(
		STAT_STRENGTH = 12,
		STAT_INTELLIGENCE = 7,
		STAT_CONSTITUTION = 11,
		STAT_ENDURANCE = 9,
		STAT_PERCEPTION = 11,
		STAT_SPEED = 10,
		/datum/attribute/skill/combat/wrestling = 60,
		/datum/attribute/skill/combat/unarmed = 60,
		/datum/attribute/skill/combat/shields = 50,
		/datum/attribute/skill/combat/axesmaces = 50,
		/datum/attribute/skill/combat/knives = 50,
		/datum/attribute/skill/combat/crossbows = 50,
		/datum/attribute/skill/combat/firearms = 100,
		/datum/attribute/skill/combat/bows = 50,
		/datum/attribute/skill/combat/swords = 85,
		/datum/attribute/skill/combat/polearms = 60,
		/datum/attribute/skill/combat/whipsflails = 60,
		/datum/attribute/skill/misc/climbing = 50,
		/datum/attribute/skill/misc/athletics = 50,
		/datum/attribute/skill/misc/reading = 100,
		/datum/attribute/skill/magic/holy = 100,
		/datum/attribute/skill/magic/arcane = 100,
		/datum/attribute/skill/magic/blood = 100,
	)

/datum/job/shirleigh_queen
	title = JOB_ADMIN_SHIRLEIGH_QUEEN
	tutorial = "Alyssandrine herself."
	job_flags = (JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	factions = list(FACTION_CABAL, FACTION_UNDEAD, SUB_FACTION_VAULT, SUB_FACTION_KEEP, FACTION_SHIRLEIGH, FACTION_TOWN)

	cmode_music = 'sound/music/cmode/antag/combat_cult.ogg'
	allowed_patrons = list(/datum/patron/inhumen/envy)

	outfit = /datum/outfit/shirleigh_queen
	honorary_f = "Lady of the First Light"

	magic_user = TRUE
	knows_the_town = TRUE
	known_by_the_town = FALSE

	exp_type = list()
	exp_types_granted = list()
	exp_requirements = list()

	attribute_sheet = /datum/attribute_holder/sheet/job/shirleigh_queen

	spells = list(
		/datum/action/cooldown/spell/aoe/knock,
		/datum/action/cooldown/spell/undirected/jaunt/ethereal_jaunt,
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/projectile/repel,
		/datum/action/cooldown/spell/gravity,
		/datum/action/cooldown/spell/strengthen_undead,
	)

	traits = list(
		TRAIT_CLOSECOMBAT,
		TRAIT_NOSTAMINA,
		TRAIT_SLEEPIMMUNE,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_ZJUMP,
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
		TRAIT_SHARPER_BLADES,
		TRAIT_BLINDFIGHTING,
		TRAIT_NOBLOOD,
		TRAIT_NOBREATH,
		TRAIT_NOHUNGER,
		TRAIT_NOHYGIENE,
		TRAIT_NOLIMBDISABLE,
		TRAIT_NOHARDCRIT,
		TRAIT_STUNIMMUNE,
		TRAIT_TOXIMMUNE,
		TRAIT_NODECAPITATE,
		TRAIT_LIMBATTACHMENT,
		TRAIT_DEADNOSE,
		TRAIT_STEELHEARTED,
		TRAIT_SORCERER,
		TRAIT_NOPAIN,
	)

	languages = list(
		/datum/language/elvish,
		/datum/language/dwarvish,
		/datum/language/hellspeak,
		/datum/language/oldunsundered,
		/datum/language/orcish,
		/datum/language/thievescant,
		/datum/language/draconic,
		/datum/language/undead
	)

/datum/job/shirleigh_queen/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_acolyte()
		devotion.grant_to(spawned)
		devotion.update_passive_devotion(5)

	spawned.adjust_technique_mastery_points(20)
	spawned.adjust_form_mastery_points(20)
	spawned.mana_pool.set_intrinsic_recharge(MANA_ALL_LEYLINES)

	if(spawned.dna?.species)
		spawned.dna.species.soundpack_m = new /datum/voicepack/female/haughty()
		spawned.dna.species.organs[ORGAN_SLOT_EYES] = /obj/item/organ/eyes/night_vision/envy

	var/list/eye_list = spawned.getorganslotlist(ORGAN_SLOT_EYES)
	for(var/obj/item/organ/eyes/eyes as anything in eye_list)
		eyes.Remove(spawned,1)
		QDEL_NULL(eyes)

	var/obj/item/organ/eyes/LE = new /obj/item/organ/eyes/night_vision/envy
	var/obj/item/organ/eyes/RE = new /obj/item/organ/eyes/night_vision/envy
	LE.switch_side(LEFT_SIDE)

	LE.Insert(spawned)
	RE.Insert(spawned)

/datum/outfit/shirleigh_queen
	name = JOB_ADMIN_SHIRLEIGH_QUEEN
	pants = /obj/item/clothing/pants/trou/formal/shorts
	shoes = /obj/item/clothing/shoes/courtphysician/female
	belt = /obj/item/storage/belt/leather/exoticsilkbelt
	beltl = /obj/item/weapon/sword/sabre/stalker
	armor = /obj/item/clothing/armor/basiceast/crafteast

/datum/attribute_holder/sheet/job/shirleigh_lackey
	raw_attribute_list = list(
		STAT_STRENGTH = 14,
		STAT_INTELLIGENCE = 5,
		STAT_CONSTITUTION = 19,
		STAT_ENDURANCE = 20,
		STAT_PERCEPTION = 17,
		STAT_SPEED = 16,
		/datum/attribute/skill/combat/wrestling = 80,
		/datum/attribute/skill/combat/unarmed = 80,
		/datum/attribute/skill/combat/shields = 80,
		/datum/attribute/skill/combat/axesmaces = 80,
		/datum/attribute/skill/combat/knives = 80,
		/datum/attribute/skill/combat/crossbows = 80,
		/datum/attribute/skill/combat/firearms = 80,
		/datum/attribute/skill/combat/bows = 80,
		/datum/attribute/skill/combat/swords = 80,
		/datum/attribute/skill/combat/polearms = 30,
		/datum/attribute/skill/combat/whipsflails = 80,
		/datum/attribute/skill/misc/climbing = 80,
		/datum/attribute/skill/misc/athletics = 80,
		/datum/attribute/skill/misc/reading = 100,
		/datum/attribute/skill/magic/holy = 100,
		/datum/attribute/skill/magic/arcane = 100,
		/datum/attribute/skill/magic/blood = 100,
	)

/datum/job/shirleigh_lackey
	title = JOB_ADMIN_SHIRLEIGH_LACKEY
	tutorial = "A Shirleighan lackey."
	job_flags = (JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	factions = list(FACTION_CABAL, FACTION_UNDEAD, SUB_FACTION_VAULT, SUB_FACTION_KEEP, FACTION_SHIRLEIGH, FACTION_TOWN)

	cmode_music = 'sound/music/cmode/antag/combat_cult.ogg'
	allowed_patrons = list(/datum/patron/inhumen/envy)

	outfit = /datum/outfit/shirleigh_lackey
	honorary_f = "Eternal Hand"

	knows_the_town = TRUE
	known_by_the_town = FALSE

	exp_type = list()
	exp_types_granted = list()
	exp_requirements = list()

	attribute_sheet = /datum/attribute_holder/sheet/job/shirleigh_lackey

	traits = list(
		TRAIT_CLOSECOMBAT,
		TRAIT_NOSTAMINA,
		TRAIT_SLEEPIMMUNE,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_ZJUMP,
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
		TRAIT_SHARPER_BLADES,
		TRAIT_BLINDFIGHTING,
		TRAIT_NOBLOOD,
		TRAIT_NOBREATH,
		TRAIT_NOHUNGER,
		TRAIT_NOHYGIENE,
		TRAIT_NOLIMBDISABLE,
		TRAIT_NOHARDCRIT,
		TRAIT_STUNIMMUNE,
		TRAIT_TOXIMMUNE,
		TRAIT_NODECAPITATE,
		TRAIT_LIMBATTACHMENT,
		TRAIT_DEADNOSE,
		TRAIT_STEELHEARTED,
		TRAIT_NOPAIN,
	)

	languages = list(
		/datum/language/elvish,
		/datum/language/undead
	)

/datum/job/shirleigh_lackey/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_acolyte()
		devotion.grant_to(spawned)
		devotion.update_passive_devotion(5)

	spawned.adjust_technique_mastery_points(20)
	spawned.adjust_form_mastery_points(20)
	spawned.mana_pool.set_intrinsic_recharge(MANA_ALL_LEYLINES)

	if(spawned.dna?.species)
		spawned.dna.species.soundpack_m = new /datum/voicepack/female/haughty()
		spawned.dna.species.organs[ORGAN_SLOT_EYES] = /obj/item/organ/eyes/night_vision/envy

	var/list/eye_list = spawned.getorganslotlist(ORGAN_SLOT_EYES)
	for(var/obj/item/organ/eyes/eyes as anything in eye_list)
		eyes.Remove(spawned,1)
		QDEL_NULL(eyes)

	var/obj/item/organ/eyes/LE = new /obj/item/organ/eyes/night_vision/envy
	var/obj/item/organ/eyes/RE = new /obj/item/organ/eyes/night_vision/envy
	LE.switch_side(LEFT_SIDE)

	LE.Insert(spawned)
	RE.Insert(spawned)

/datum/outfit/shirleigh_lackey
	name = JOB_ADMIN_SHIRLEIGH_LACKEY
	pants = /obj/item/clothing/pants/platelegs/captain
	shoes = /obj/item/clothing/shoes/nobleboot/duelboots
	belt = /obj/item/storage/belt/leather/plaquesilver
	cloak = /obj/item/clothing/cloak/half/duelcape
	gloves = /obj/item/clothing/gloves/angle/masterwork
	beltl = /obj/item/weapon/scabbard/cudese
	beltr = /obj/item/weapon/scabbard/sword/royal
	backl = /obj/item/gun/ballistic/powder/wheellock/blunderbuss
	backr = /obj/item/gun/ballistic/powder/musket
	ring = /obj/item/clothing/ring/dragon_ring
	head = /obj/item/clothing/head/leather/duelhat
	mouth = /obj/item/clothing/face/cigarette/rollie/nicotine/zigar
	mask = /obj/item/clothing/face/shepherd/clothmask
	glasses = /obj/item/clothing/face/spectacles/sglasses
	shirt = /obj/item/clothing/armor/gambeson/heavy/colored
	suit = /obj/item/clothing/armor/leather/jacket/leathercoat/duelcoat
	backpack_contents = list(/obj/item/scomstone/bad = 1, /obj/item/reagent_containers/glass/bottle/aflask = 1, /obj/item/ammo_holder/bullet/bullets = 2, /obj/item/needle/blessed = 1)
