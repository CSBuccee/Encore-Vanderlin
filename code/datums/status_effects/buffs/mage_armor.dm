#define MAGE_ARMOR_FILTER "mage_armor_glow"

/atom/movable/screen/alert/status_effect/buff/mage_armor
	name = "Mage Armor"
	desc = "A shimmering ward of arcyne force hugs my body."
	icon_state = "buff"

/datum/status_effect/buff/mage_armor
	var/outline_colour = "#7b68ee"
	id = "mage_armor"
	alert_type = /atom/movable/screen/alert/status_effect/buff/mage_armor
	status_type = STATUS_EFFECT_REFRESH
	duration = 5 MINUTES

/datum/status_effect/buff/mage_armor/on_apply()
	if(!ishuman(owner))
		return FALSE
	var/mob/living/carbon/human/H = owner
	// Don't clobber someone else's skin armor (werewolf hide, vampire fortitude, tattoos...)
	if(H.skin_armor)
		return FALSE
	H.skin_armor = new /obj/item/clothing/armor/skin_armor/mage_armor(H)
	if(!owner.get_filter(MAGE_ARMOR_FILTER))
		owner.add_filter(MAGE_ARMOR_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 120, "size" = 1))
	return ..()

/datum/status_effect/buff/mage_armor/refresh(mob/living/new_owner, duration_override, ...)
	. = ..()
	var/mob/living/carbon/human/H = owner
	if(istype(H?.skin_armor, /obj/item/clothing/armor/skin_armor/mage_armor))
		QDEL_NULL(H.skin_armor)
		H.skin_armor = new /obj/item/clothing/armor/skin_armor/mage_armor(H)

/datum/status_effect/buff/mage_armor/on_remove()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		if(istype(H.skin_armor, /obj/item/clothing/armor/skin_armor/mage_armor))
			QDEL_NULL(H.skin_armor)
			to_chat(H, span_warning("My arcyne ward fades away."))
	owner.remove_filter(MAGE_ARMOR_FILTER)
	. = ..()

/obj/item/clothing/armor/skin_armor/mage_armor
	slot_flags = null
	name = "arcyne ward"
	desc = ""
	icon_state = null
	body_parts_covered = FULL_BODY
	armor_type = /datum/armor/skin/mage_armor
	prevent_crits = ALL_EXCEPT_CHOP_AND_STAB
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	sewrepair = null
	max_integrity = INTEGRITY_STRONG + 50

/obj/item/clothing/armor/skin_armor/mage_armor/atom_break(damage_flag, silent)
	. = ..()
	var/mob/living/carbon/human/H = loc
	if(!istype(H) || H.skin_armor != src)
		return
	to_chat(H, span_warning("My arcyne ward shatters!"))
	// Deferred so the buff isn't1 deleted mid-way through the attack that broke it
	addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living, remove_status_effect), /datum/status_effect/buff/mage_armor), 1)

#undef MAGE_ARMOR_FILTER
