
/obj/item/clothing/cloak/stabard
	name = "surcoat"
	icon_state = "stabard"
	alternate_worn_layer = TABARD_LAYER
	body_parts_covered = CHEST|GROIN
	boobed = TRUE
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/detailed/tabards.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/detailed/tabards.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	detail_tag = "_quad"
	detail_color = CLOTHING_RED_OCHRE
	var/picked

/obj/item/clothing/cloak/stabard/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return

	. = SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

	if(picked)
		return

	var/the_time = world.time

	var/design = tgui_input_list(user, "Select a design.","Tabard Design", list("None","Split", "Quadrants", "Boxes", "Diamonds"))
	if(!design)
		return

	var/colorone = tgui_input_list(user, "Select a primary color.","Tabard Design", GLOB.noble_dyes)
	if(!colorone)
		return

	var/colortwo
	if(design != "None")
		colortwo = tgui_input_list(user, "Select a primary color.","Tabard Design", GLOB.noble_dyes)
		if(!colortwo)
			return

	if(world.time > (the_time + 30 SECONDS))
		return

	switch(design)
		if("Split")
			detail_tag = "_spl"
		if("Quadrants")
			detail_tag = "_quad"
		if("Boxes")
			detail_tag = "_box"
		if("Diamonds")
			detail_tag = "_dim"

	color = GLOB.noble_dyes[colorone]
	if(colortwo)
		detail_color = GLOB.noble_dyes[colortwo]

	update_appearance(UPDATE_OVERLAYS)

	if(tgui_alert(user, "Are you pleased with your heraldry?", "Heraldry", list("Yes", "No")) != "Yes")
		detail_color = initial(detail_color)
		color = initial(color)
		detail_tag = initial(detail_tag)
		update_appearance(UPDATE_OVERLAYS)
		return

	picked = TRUE

/obj/item/clothing/cloak/stabard/guard
	desc = "A tabard with the lord's heraldic colors. This one is worn typically by guards."
	color = COLOR_WHITE
	detail_tag = "_spl"
	detail_color = COLOR_SHIRLEIGH_BLUE
	uses_lord_coloring = LORD_PRIMARY | LORD_DETAIL_AND_COLOR

/obj/item/clothing/cloak/stabard/guard/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	. = SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	if(picked)
		return
	var/the_time = world.time
	var/chosen = input(user, "Select a design.","Tabard Design") as null|anything in list("Split", "Quadrants", "Boxes", "Diamonds")
	if(world.time > (the_time + 10 SECONDS))
		return
	if(!chosen)
		return
	switch(chosen)
		if("Split")
			detail_tag = "_spl"
		if("Quadrants")
			detail_tag = "_quad"
		if("Boxes")
			detail_tag = "_box"
		if("Diamonds")
			detail_tag = "_dim"
	update_appearance(UPDATE_OVERLAYS)
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
	if(tgui_alert(usr, "Are you pleased with your heraldry?", "Heraldry", list("Yes", "No")) != "Yes")
		detail_tag = initial(detail_tag)
		update_appearance(UPDATE_OVERLAYS)
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_cloak()
		return
	picked = TRUE

/obj/item/clothing/cloak/stabard/colored
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/cloak/stabard/colored/dungeon
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/cloak/stabard/colored/dungeon/attack_hand_secondary(mob/user, list/modifiers)
	return

/obj/item/clothing/cloak/stabard/mercenary/Initialize()
	. = ..()
	detail_tag = pick("_quad", "_spl", "_box", "_dim")
	color = pick_assoc(GLOB.noble_dyes)
	detail_color = pick_assoc(GLOB.noble_dyes)
	update_appearance(UPDATE_ICON)

/obj/item/clothing/cloak/stabard/kaledon
	detail_tag = "_box"
	color = CLOTHING_MAGE_BLUE
	detail_color = CLOTHING_BOG_GREEN

//////////////////////////
/// CRUSADER
////////////////////////

/obj/item/clothing/cloak/stabard/templar
	name = "surcoat of the golden order"
	icon_state = "tabard_weeping"
	item_state = "tabard_weeping"
	icon = 'icons/roguetown/clothing/special/templar.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/templar.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/templar.dmi'
	detail_tag = null
	detail_color = null

/obj/item/clothing/cloak/stabard/templar/visires
	name = "surcoat of the solar order"
	icon_state = "tabard_astrata"
	item_state = "tabard_astrata"

/obj/item/clothing/cloak/stabard/templar/visires/alt
	icon_state = "tabard_astrata_alt"
	item_state = "tabard_astrata_alt"

/obj/item/clothing/cloak/stabard/templar/valdala
	name = "surcoat of the valdalan order"
	icon_state = "tabard_necra"
	item_state = "tabard_necra"

/obj/item/clothing/cloak/stabard/templar/valdala/alt
	icon_state = "tabard_necra_alt"
	item_state = "tabard_necra_alt"

/obj/item/clothing/cloak/stabard/templar/gani
	name = "surcoat of the earthen order"
	icon_state = "tabard_dendor"
	item_state = "tabard_dendor"

/obj/item/clothing/cloak/stabard/templar/akan
	name = "surcoat of the lunar order"
	icon_state = "tabard_noc"
	item_state = "tabard_noc"

/obj/item/clothing/cloak/stabard/templar/akan/alt
	icon_state = "tabard_noc_alt"
	item_state = "tabard_noc_alt"

/obj/item/clothing/cloak/stabard/templar/mjallidhorn
	name = "surcoat of the abyssal order"
	icon_state = "tabard_abyssor"
	item_state = "tabard_abyssor"

/obj/item/clothing/cloak/stabard/templar/mjallidhorn/alt
	name = "surcoat of the abyssal order"
	icon_state = "tabard_abyssor_alt"
	item_state = "tabard_abyssor_alt"


/obj/item/clothing/cloak/stabard/templar/golerkanh
	name = "surcoat of the kanhite order"
	icon_state = "tabard_malum"
	item_state = "tabard_malum"

/obj/item/clothing/cloak/stabard/templar/pomette
	name = "surcoat of the pomettic order"
	icon_state = "tabard_eora"
	item_state = "tabard_eora"

/obj/item/clothing/cloak/stabard/templar/erdl
	name = "surcoat of the erdite order"
	icon_state = "tabard_pestra"
	item_state = "tabard_pestra"

/obj/item/clothing/cloak/stabard/templar/mordsol
	name = "surcoat of the mordsolian order"
	icon_state = "tabard_ravox"
	item_state = "tabard_ravox"

/obj/item/clothing/cloak/stabard/templar/justice
	name = "surcoat of the justice order"
	icon_state = "justicetabard"
	item_state = "justicetabard"
	icon = 'icons/roguetown/clothing/special/ravoxtemplar.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/ravoxtabard.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/ravoxtabard.dmi'

/obj/item/clothing/cloak/stabard/templar/iliope
	name = "surcoat of the fools order"
	icon_state = "tabard_xylix"
	item_state = "tabard_xylix"

//////////////////////////
/// SURCOATS
////////////////////////

/obj/item/clothing/cloak/stabard/jupon
	name = "jupon"
	icon_state = "surcoat"
	color = CLOTHING_MUSTARD_YELLOW
	detail_tag = "_spl"
	detail_color = CLOTHING_SOOT_BLACK

/obj/item/clothing/cloak/stabard/jupon/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return

	. = SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

	if(picked)
		return

	var/the_time = world.time

	var/design = tgui_input_list(user, "Select a design.","Tabard Design", list("None", "Split", "Quadrants", "Boxes", "Diamonds"))
	if(!design)
		return

	var/colorone = tgui_input_list(user, "Select a primary color.","Tabard Design", GLOB.noble_dyes)
	if(!colorone)
		return

	var/colortwo
	if(design != "None")
		colortwo = tgui_input_list(user, "Select a primary color.","Tabard Design", GLOB.noble_dyes)
		if(!colortwo)
			return

	if(world.time > (the_time + 30 SECONDS))
		return

	switch(design)
		if("Split")
			detail_tag = "_spl"
		if("Quadrants")
			detail_tag = "_quad"
		if("Boxes")
			detail_tag = "_box"
		if("Diamonds")
			detail_tag = "_dim"

	color = GLOB.noble_dyes[colorone]
	if(colortwo)
		detail_color = GLOB.noble_dyes[colortwo]

	update_appearance(UPDATE_OVERLAYS)

	if(tgui_alert(user, "Are you pleased with your heraldry?", "Heraldry", list("Yes", "No")) != "Yes")
		detail_color = initial(detail_color)
		color = initial(color)
		detail_tag = initial(detail_tag)
		update_appearance(UPDATE_OVERLAYS)
		return

	picked = TRUE

/obj/item/clothing/cloak/stabard/jupon/guard
	desc = "A jupon with the lord's heraldic colors."
	color = COLOR_WHITE
	detail_tag = "_quad"
	detail_color = COLOR_SHIRLEIGH_BLUE
	uses_lord_coloring = LORD_PRIMARY | LORD_DETAIL_AND_COLOR

/obj/item/clothing/cloak/stabard/jupon/guard/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	. = SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	if(picked)
		return
	var/the_time = world.time
	var/chosen = input(user, "Select a design.","Tabard Design") as null|anything in list("Split", "Quadrants", "Boxes", "Diamonds")
	if(world.time > (the_time + 10 SECONDS))
		return
	if(!chosen)
		return
	switch(chosen)
		if("Split")
			detail_tag = "_spl"
		if("Quadrants")
			detail_tag = "_quad"
		if("Boxes")
			detail_tag = "_box"
		if("Diamonds")
			detail_tag = "_dim"
	update_appearance(UPDATE_ICON)
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
	if(tgui_alert(usr, "Are you pleased with your heraldry?", "Heraldry", list("Yes", "No")) != "Yes")
		detail_tag = initial(detail_tag)
		update_appearance(UPDATE_ICON)
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_cloak()
		return
	picked = TRUE
