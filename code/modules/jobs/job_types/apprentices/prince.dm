/datum/job/prince
	title = JOB_PRINCE
	f_title = JOB_PRINCE_FEM
	tutorial = "You've never felt the gnawing of the winter, \
	never known the bite of hunger and certainly have never known a honest day's work. \
	You are as free as any bird in the sky, \
	and you may revel in your debauchery for as long as your parents remain upon the throne: \
	But someday you'll have to grow up, and that will be the day your carelessness will cost you more than a few mammons."
	department_flag = APPRENTICES
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	factions = list(FACTION_SHIRLEIGH, FACTION_TOWN, SUB_FACTION_KEEP, SUB_FACTION_VAULT)
	total_positions = 99
	spawn_positions = 99
	display_order = JDO_PRINCE
	give_bank_account = TRUE
	knows_the_town = TRUE
	known_by_the_town = TRUE
	bypass_lastclass = TRUE

	can_have_apprentices = FALSE
	noble_income = 20
	cmode_music = 'sound/music/cmode/nobility/combat_noble.ogg'

	allowed_races = RACES_PLAYER_ROYALTY
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_patrons = /datum/patron/inhumen/envy
	advclass_cat_rolls = list(CTAG_HEIR = 20)
	honorary = "Prince"
	honorary_f = "Princess"


	outfit = /datum/outfit/heir

	spells = list(
		/datum/action/cooldown/spell/undirected/list_target/grant_title,
	)

	exp_types_granted = list(EXP_TYPE_NOBLE)

	mind_traits = list(
		TRAIT_KNOW_KEEP_DOORS
	)
	traits = list(
		TRAIT_NOBLE_BLOOD,
		TRAIT_NOBLE_POWER
	)

/datum/job/prince/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	addtimer(CALLBACK(SSfamilytree, TYPE_PROC_REF(/datum/controller/subsystem/familytree, AddRoyal), spawned, FAMILY_PROGENY), 10 SECONDS)

/datum/job/prince/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_shirleigh_strong()
		devotion.grant_to(spawned)


/datum/job/prince/adjust_patron(mob/living/carbon/human/spawned)
	var/datum/patron/old_patron = spawned.patron
	if(old_patron?.type == /datum/patron/inhumen/envy)
		return

	spawned.set_patron(/datum/patron/inhumen/envy, TRUE)

	var/datum/patron/new_patron = spawned.patron
	if(old_patron != new_patron) // If the patron we selected first does not match the patron we end up with, display the message.
		to_chat(spawned, span_warning("[old_patron.display_name ? old_patron.display_name : old_patron] holds no sway over me. For better or for worse, [new_patron.display_name ? new_patron.display_name : new_patron] is within me."))


/datum/job/advclass/heir
	inherit_parent_title = TRUE
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = RACES_PLAYER_ROYALTY
	exp_type = list(EXP_TYPE_NOBLE)
	exp_types_granted = list(EXP_TYPE_NOBLE)
	factions = list(FACTION_SHIRLEIGH, FACTION_TOWN, SUB_FACTION_KEEP, SUB_FACTION_VAULT)

/datum/attribute_holder/sheet/job/heir/daring
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		STAT_PERCEPTION = 1,
		STAT_CONSTITUTION = 1,
		STAT_SPEED = 1,
		STAT_FORTUNE = 1,

		/datum/attribute/skill/combat/axesmaces = 10,
		/datum/attribute/skill/combat/bows = 20,
		/datum/attribute/skill/combat/crossbows = 20,
		/datum/attribute/skill/combat/swords = 20,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/knives = 10,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/misc/athletics = 10,
		/datum/attribute/skill/misc/riding = 30,
		/datum/attribute/skill/misc/reading = 20,
		/datum/attribute/skill/labor/mathematics = 30
	)

/datum/job/advclass/heir/daring
	title = "Prideful Heir"
	tutorial = "You're a somebody, someone important. You were always able to harness the powers of the One Envy well, and have some semblance of control over a sword, at least."
	outfit = /datum/outfit/heir/daring
	category_tags = list(CTAG_HEIR)

	attribute_sheet = /datum/attribute_holder/sheet/job/heir/daring

	traits = list(
		TRAIT_MEDIUMARMOR
	)





/datum/outfit/heir/daring
	name = "Prideful Heir (Prince)"
	pants = /obj/item/clothing/pants/tights
	shirt = /obj/item/clothing/shirt/undershirt/colored/guard
	armor = /obj/item/clothing/armor/chainmail
	shoes = /obj/item/clothing/shoes/nobleboot
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/weapon/sword
	beltr = /obj/item/storage/keyring/heir
	neck = /obj/item/storage/belt/pouch/coins/rich
	backr = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/servant_bell/lord = 1,
	)

/datum/attribute_holder/sheet/job/heir/aristocrat
	raw_attribute_list = list(
		STAT_PERCEPTION = 2,
		STAT_STRENGTH = -1,
		STAT_INTELLIGENCE = 2,
		STAT_FORTUNE = 1,
		STAT_SPEED = 1,

		/datum/attribute/skill/combat/bows = 10,
		/datum/attribute/skill/combat/wrestling = 10,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/combat/knives = 10,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/riding = 20,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/craft/cooking = 10,
		/datum/attribute/skill/misc/sewing = 10,
		/datum/attribute/skill/labor/mathematics = 30
	)

	attribute_variance = list(
		/datum/attribute/skill/combat/crossbows = list(0, 10),
		/datum/attribute/skill/misc/athletics = list(0, 10)
	)

/datum/job/advclass/heir/aristocrat
	title = "Unawakened Blood"
	tutorial = "The One Envy's power in your blood is mostly dormant. Life has been kind to you; you've an entire keep at your disposal, servants to wait on you, and a whole retinue of guards to guard you. You've nothing to prove; just live the good life and you'll be a lord someday, too. A lack of ambition translates into a lacking skillset beyond schooling, though, and your breaks from boredom consist of being a damsel or court gossip."
	outfit = /datum/outfit/heir/aristocrat
	category_tags = list(CTAG_HEIR)
	attribute_sheet = /datum/attribute_holder/sheet/job/heir/aristocrat

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_BEAUTIFUL,
		TRAIT_VIRGIN,
	)

/datum/job/advclass/heir/aristocrat/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_shirleigh_weak()
		devotion.grant_to(spawned)

/datum/outfit/heir/aristocrat
	name = "Unawakened Blood (Prince)"
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/keyring/heir
	beltr = /obj/item/storage/belt/pouch/coins/rich

	backpack_contents = list(
		/obj/item/servant_bell/lord = 1,
	)

/datum/outfit/heir/aristocrat/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		pants = /obj/item/clothing/pants/tights
		shirt = /obj/item/clothing/shirt/dress/royal/prince
		belt = /obj/item/storage/belt/leather
		shoes = /obj/item/clothing/shoes/nobleboot
	else
		belt = /obj/item/storage/belt/leather/cloth/lady
		head = /obj/item/clothing/head/hennin
		shirt = /obj/item/clothing/shirt/dress/royal/princess
		shoes = /obj/item/clothing/shoes/shortboots
		pants = /obj/item/clothing/pants/tights/colored/random

/datum/attribute_holder/sheet/job/heir/forgotten
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_FORTUNE = 1,
		STAT_CONSTITUTION = 1,
		STAT_ENDURANCE = 2,

		/datum/attribute/skill/combat/crossbows = 10,
		/datum/attribute/skill/combat/bows = 10,
		/datum/attribute/skill/combat/swords = 10,
		/datum/attribute/skill/combat/wrestling = 25,
		/datum/attribute/skill/combat/unarmed = 25,
		/datum/attribute/skill/combat/knives = 25,
		/datum/attribute/skill/combat/shields = 30,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/misc/riding = 20,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/craft/cooking = 10,
		/datum/attribute/skill/misc/sewing = 10,
		/datum/attribute/skill/labor/mathematics = 30,
		/datum/attribute/skill/misc/athletics = 30,
	)

/datum/attribute_holder/sheet/job/heir/forgotten/sword
	raw_attribute_list = list(
		/datum/attribute/skill/combat/swords = 20,
	)

/datum/attribute_holder/sheet/job/heir/forgotten/bow
	raw_attribute_list = list(
		/datum/attribute/skill/combat/bows = 20,
		/datum/attribute/skill/combat/swords = 10,
	)

/datum/job/advclass/heir/forgotten
	title = "Forgotten Child"
	tutorial = "You are an unawakened child of the Shirleighs. Rather than be deterred, it only made sense that you studied the blade, to gain your own glory and prove yourself worthy of your name. Through martial prowess alone, perhaps your kin may see how great you really are."
	outfit = /datum/outfit/heir/forgotten
	category_tags = list(CTAG_HEIR)
	attribute_sheet = /datum/attribute_holder/sheet/job/heir/forgotten

	traits = list(
		TRAIT_MEDIUMARMOR,
	)

/datum/job/advclass/heir/forgotten/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_shirleigh_weak()
		devotion.grant_to(spawned)

/datum/outfit/heir/forgotten
	name = "Forgotten child (Prince)"
	pants = /obj/item/clothing/pants/tights
	shirt = /obj/item/clothing/armor/gambeson/arming
	armor = /obj/item/clothing/armor/brigandine/light
	gloves = /obj/item/clothing/gloves/fingerless
	beltl = /obj/item/storage/keyring/heir
	belt = /obj/item/storage/belt/leather
	shoes = /obj/item/clothing/shoes/nobleboot

	backr = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/weapon/knife/dagger/steel/special = 1, /obj/item/weapon/scabbard/knife/royal = 1, /obj/item/servant_bell/lord = 1,)

/datum/job/advclass/heir/forgotten/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/static/list/selectable = list(
		"Decorated Sword" = list(/obj/item/weapon/sword/decorated, /obj/item/weapon/scabbard/sword/royal),
		"Decorated Rapier" = list(/obj/item/weapon/sword/rapier/dec, /obj/item/weapon/scabbard/sword/royal),
		"Decorated Sabre" = list(/obj/item/weapon/sword/sabre/dec, /obj/item/weapon/scabbard/sword/royal),
		"Qadirid Scimitar" = list(/obj/item/weapon/sword/long/rider, /obj/item/weapon/scabbard/sword/royal),
		"Steppe Sabre" = list(/obj/item/weapon/sword/long/rider/steppe, /obj/item/weapon/scabbard/sword/royal),
		"Katana" = list(/obj/item/weapon/sword/katana, /obj/item/weapon/scabbard/cudese/gold),
		"Shortbow + Shortsword" = list(/obj/item/gun/ballistic/bow/short, /obj/item/ammo_holder/quiver/arrows, /obj/item/weapon/sword/short, /obj/item/weapon/scabbard/sword/royal),
	)
	var/choice = spawned.select_equippable(player_client, selectable, message = "Choose Your Blade", title = "HEIR")
	if(!choice)
		return
	switch(choice)
		if("Decorated Sword")
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/heir/forgotten/sword)
		if("Decorated Rapier")
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/heir/forgotten/sword)
		if("Decorated Sabre")
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/heir/forgotten/sword)
		if("Qadirid Scimitar")
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/heir/forgotten/sword)
		if("Steppe Sabre")
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/heir/forgotten/sword)
		if("Katana")
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/heir/forgotten/sword)
		if("Shortbow + Shortsword")
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/heir/forgotten/bow)
