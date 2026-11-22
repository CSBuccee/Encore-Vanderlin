/datum/attribute_holder/sheet/job/sellsword
	raw_attribute_list = list(
		STAT_STRENGTH = 3,
		STAT_ENDURANCE = 3,
		STAT_CONSTITUTION = 2,
		STAT_SPEED = 2,
		/datum/attribute/skill/combat/polearms = 40,
		/datum/attribute/skill/combat/axesmaces = 20,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/combat/swords = 40,
		/datum/attribute/skill/combat/shields = 40,
		/datum/attribute/skill/combat/whipsflails = 30,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/combat/bows = 20,
		/datum/attribute/skill/combat/crossbows = 40,
		/datum/attribute/skill/craft/crafting = 20,
		/datum/attribute/skill/craft/carpentry = 10,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/misc/climbing = 30,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/sewing = 10,
		/datum/attribute/skill/misc/medicine = 30,
		/datum/attribute/skill/craft/weapon_repair = 20,
		/datum/attribute/skill/craft/armor_repair = 20,
	)

/datum/job/advclass/bandit/sellsword //Strength class, starts with axe or flails and medium armor training
	title = "Sellsword"
	tutorial = "Perhaps a mercenary, perhaps a deserter - at one time, you killed for a master in return for gold. Now you live with no such master over your head - and take what you please."
	allowed_sexes = list(MALE, FEMALE)

	outfit = /datum/outfit/bandit/sellsword
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/cmode/antag/combat_bandit2.ogg'

	attribute_sheet = /datum/attribute_holder/sheet/job/sellsword

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_CLOSECOMBAT,
		TRAIT_STEELHEARTED,
		TRAIT_DEADNOSE,
	)

/datum/job/advclass/bandit/sellsword/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	var/static/list/weapons = list(
		"Spear & Crossbow" = list(/obj/item/weapon/polearm/spear/billhook, /obj/item/gun/ballistic/bow/cross),
		"Sword & Buckler" = list(/obj/item/weapon/sword, /obj/item/weapon/shield/tower/buckleriron),
		"Footman War Axe" = list(/obj/item/weapon/polearm/halberd/bardiche/warcutter)
	)
	var/weapon_choice = spawned.select_equippable(player_client, weapons, message = "Choose your weapon.", title = "TAKE UP ARMS.")
	switch(weapon_choice)
		if("Spear & Crossbow")
			spawned.equip_to_slot_or_del(new /obj/item/ammo_holder/quiver/bolts, ITEM_SLOT_BELT_R, TRUE)
			spawned.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/kettle/qadirid, ITEM_SLOT_HEAD, TRUE)
		if("Sword & Buckler")
			spawned.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/sallet, ITEM_SLOT_HEAD, TRUE)
		if("Footman War Axe")
			spawned.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/sallet, ITEM_SLOT_HEAD, TRUE)

/datum/outfit/bandit/sellsword
	name = "Sellsword (Bandit)"
	belt = /obj/item/storage/belt/leather
	pants = /obj/item/clothing/pants/trou/leather
	shirt = /obj/item/clothing/armor/gambeson/heavy
	shoes = /obj/item/clothing/shoes/boots/darkboots
	backr = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/needle = 1, /obj/item/natural/bundle/cloth/bandage/full = 1, /obj/item/clothing/face/shepherd/rag = 1, /obj/item/weapon/hammer/iron = 1)
	mask = /obj/item/clothing/face/facemask/steel/ancient/bandit
	neck = /obj/item/clothing/neck/gorget/ancient/bandit
	armor = /obj/item/clothing/armor/chainmail/ancient/bandit
	gloves = /obj/item/clothing/gloves/chain/ancient/bandit
