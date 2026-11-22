GLOBAL_LIST_INIT(persistent_storage_blacklist, list(
	/obj/item/gun/ballistic/bow/turbulenta,
	/obj/item/weapon/sword/long/pleonexia,
	/obj/item/weapon/sword/long/angros/relic,
	/obj/item/weapon/sword/long/holysee,
	/obj/item/clothing/head/crown/serpcrown,
	/obj/item/weapon/polearm/halberd/angros/relic,
	/obj/item/weapon/sword/long/greatsword/angros,
	/obj/item/flashlight/flare/torch/lantern/psycenser,
	/obj/item/weapon/whip/angros/relic,
	/obj/item/angrosmusicbox,
))
//This is persistent storage that allows us to save singular objects
//In practice, this will allow players to store heirlooms and stuff like armor sets in limited quantities
//That way, we can avoid the inevitable hoarding of armories in everyone's basement, while also allowing people to keep epic loot
//Mechanically this operates kind of like a fireaxe cabinet with special var saving
/obj/structure/persistent_storage
	name = "instanced vessel"
	desc = "A marvel of Doman ingenuity, it saves space by storing your particular valuables in an easy-to-access compartment that shields it from the strains of summoning instances."
	icon = 'icons/roguetown/misc/domotan/instancer_vessel.dmi'
	icon_state = "empty"
	anchored = TRUE
	density = TRUE
	armor_type = /datum/armor/displaycase
	max_integrity = 500
	integrity_failure = 0
	var/obj/item
	var/spawn_contents

/obj/structure/persistent_storage/Initialize()
	. = ..()
	if(length(spawn_contents))
		for(var/atom/movable/spawning_atom as anything in spawn_contents)
			new spawning_atom(src)
	if(length(contents))
		item = contents[1]
	if(item)
		add_overlay(mutable_appearance(item.icon, item.icon_state))
	update_appearance(UPDATE_ICON_STATE)

/obj/structure/persistent_storage/Destroy()
	if(item)
		QDEL_NULL(item)
	return ..()

/obj/structure/persistent_storage/get_save_vars()
	. = ..()
	spawn_contents = list()
	for(var/obj/item/item in contents)
		LAZYADD(spawn_contents, item.type)
	. += NAMEOF(src, spawn_contents)

/obj/structure/persistent_storage/attackby(obj/item/I, mob/user, list/modifiers)
	if(istype(I, /obj/item) && !item)
		var/obj/item/F = I
		for(var/blacklisted_type in GLOB.persistent_storage_blacklist)
			if(istype(F, blacklisted_type))
				to_chat(user, "<span class='warning'>This item can not be saved persistently, as the game forbids it.</span>")
				return
		if(HAS_TRAIT(F, TRAIT_UNSAVEABLE))
			to_chat(user, "<span class='warning'>This item can not be saved persistently, as it has been marked against it this round.</span>")
			return
		if(HAS_TRAIT(F, TRAIT_WIELDED))
			to_chat(user, "<span class='warning'>Unwield \the [F] first.</span>")
			return
		if(ismob(F))
			to_chat(user, "<span class='warning'>You can not store living beings here.</span>")
			return
		if(!user.transferItemToLoc(F, src))
			return
		item = F
		to_chat(user, "<span class='notice'>I place \the [F] back in \the [src].</span>")
		add_overlay(mutable_appearance(item.icon, item.icon_state))
		update_appearance(UPDATE_ICON_STATE)
		return
	return ..()

/obj/structure/persistent_storage/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(item)
		user.put_in_hands(item)
		to_chat(user, "<span class='notice'>I take \the [item] from \the [src].</span>")
		item = null
		src.add_fingerprint(user)
		cut_overlays()
		update_appearance(UPDATE_ICON_STATE)
		return

/obj/structure/persistent_storage/attack_paw(mob/living/user)
	return attack_hand(user)

/obj/structure/persistent_storage/update_icon_state()
	. = ..()
	icon_state = "empty"
	if(item)
		icon_state = "occupied"
