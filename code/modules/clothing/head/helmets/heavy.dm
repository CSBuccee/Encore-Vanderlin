/obj/item/clothing/head/helmet/heavy
	name = "helmet template"
	icon_state = "barbute"
	flags_inv = HIDEEARS|HIDEFACE
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	block2add = FOV_RIGHT|FOV_LEFT
	equip_delay_self = 3 SECONDS
	unequip_delay_self = 3 SECONDS
	emote_environment = 3		// Unknown if this actually works and what it does
	melt_amount = 75
	melting_material = /datum/material/steel
	sellprice = VALUE_STEEL_HELMET

	item_weight = 3.7 KILOGRAMS

	armor_type = /datum/armor/head/plate
	body_parts_covered = FULL_HEAD
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONGEST // no moving parts, steel
	abstract_type = /obj/item/clothing/head/helmet/heavy

/obj/item/clothing/head/helmet/heavy/necked		// includes a coif or gorget part to cover neck. Why? So templars can wear their cross on their neck basically, also special thing for Temple
	name = "bastion helm"
	desc = "A modified great helm designed for Templars, this helmet with integrated neck protection serves as an unyielding bastion of protection for the devout."
	icon_state = "topfhelm"
	armor_type = /datum/armor/head/plate
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	body_parts_covered = HEAD_NECK
	prevent_crits = ALL_EXCEPT_BLUNT
	block2add = FOV_BEHIND

/obj/item/clothing/head/helmet/heavy/undivided
	name = "templar silver sallet"
	icon_state = "silversallet"
	item_state = "silversallet"

/obj/item/clothing/head/helmet/heavy/undivided/attackby(obj/item/W, mob/living/user, params)
	. = ..()
	if(!istype(W, /obj/item/natural/cloth) || detail_tag)
		return
	var/choice = tgui_input_list(user, "Choose a color.", "Uniform colors", GLOB.noble_dyes)
	if(!choice)
		return
	user.visible_message(span_warning("[user] adds [W] to [src]."))
	qdel(W)
	detail_color = GLOB.noble_dyes[choice]
	detail_tag = "_detail"
	update_appearance(UPDATE_ICON)

/obj/item/clothing/head/helmet/heavy/bronze
	name = "bronze barbute"
	desc = "A greathelm of bronze, who's nasalguard and mandibles leave the wearer's face cloaked in darkness. The heroes of yore have long since passed, yet their blood still courses through the veins of Gani's children; you are no different. Quiff a feather to its skullcap to bare your allegience with pride."
	body_parts_covered = FULL_HEAD
	icon_state = "bronzebarbute"
	item_state = "bronzebarbute"
	flags_inv = HIDEEARS|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	block2add = FOV_BEHIND
	melting_material = /datum/material/bronze
	max_integrity = ARMOR_INT_HELMET_HEAVY_IRON
	armor_class = AC_MEDIUM

/obj/item/clothing/head/helmet/heavy/bronze/attackby(obj/item/W, mob/living/user, params)
	. = ..()
	if(!istype(W, /obj/item/natural/feather) || detail_tag)
		return
	var/choice = tgui_input_list(user, "Choose a color.", "Uniform colors", GLOB.noble_dyes)
	if(!choice)
		return
	user.visible_message(span_warning("[user] adds [W] to [src]."))
	qdel(W)
	detail_color = GLOB.noble_dyes[choice]
	detail_tag = "_detail"
	update_appearance(UPDATE_ICON)

/obj/item/clothing/head/helmet/heavy/angrosbarbute
	name = "katholikon barbute"
	desc = "A barbute styled with imagery of the Katholikos."
	icon_state = "psydonbarbute"
	item_state = "psydonbarbute"
	block2add = FOV_BEHIND
	melting_material = /datum/material/silver

/obj/item/clothing/head/helmet/heavy/angroshelm
	name = "katholikon armet"
	desc = "Headwear commonly worn by Templars in service to the Katholikon's Inquisition."
	icon_state = "psydonarmet"
	item_state = "psydonarmet"
	block2add = FOV_BEHIND
	melting_material = /datum/material/silver

//................ Iron Plate Helmet ............... //
/obj/item/clothing/head/helmet/heavy/ironplate
	name = "iron plate helmet"
	desc = "An iron masked helmet usually worn by armed men, it is a solid design yet antiquated and cheap."
	icon_state = "ironplate"
	flags_inv = HIDEEARS
	smeltresult = /obj/item/ingot/iron
	melting_material = /datum/material/iron
	sellprice = VALUE_CHEAP_IRON_HELMET
	block2add = FOV_BEHIND

	armor_type = /datum/armor/head/plate/bad
	max_integrity = INTEGRITY_STRONG //isn't the same as a steel helmet but is better than a skullcap, costs 2 bars and protects the mouth
	item_weight = 3.5 KILOGRAMS

//............... Rusted Barbute ............... //
/obj/item/clothing/head/helmet/heavy/rust
	name = "rusted barbute"
	desc = "A rusted barbute. Relatively fragile, and might turn your hair brown, but offers good protection."
	icon = 'icons/roguetown/clothing/special/rust_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/rust_armor.dmi'
	icon_state = "rusthelm"
	item_state = "rusthelm"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR/2
	armor_type = /datum/armor/head/plate/bad
	max_integrity = INTEGRITY_STANDARD
	item_weight = 2.4 KILOGRAMS

/obj/item/clothing/head/helmet/heavy/rust/bandit
	name = "rusted alloy barbute"
	desc = "A rusted barbute. Might turn your hair brown, but offers good protection. This one seems made of a strange alloy... "
	armor_type = /datum/armor/head/plate
	max_integrity = INTEGRITY_STRONG

/obj/item/clothing/head/helmet/heavy/cudese
	name = "cudese kabuto"
	desc = "A Cudese helmet of steel plates, commonly worn with a mask or mouthguard."
	flags_inv = HIDEEARS|HIDEHAIR
	flags_cover = null
	icon_state = "kazengunheavyhelm"
	melt_amount = 75
	melting_material = /datum/material/blacksteel

/obj/item/clothing/head/helmet/heavy/aalloy
	name = "decrepit barbute"
	desc = "Frayed bronze plates, pounded into a visored helmet. Scrapes and dents line the curved plating, weathered from centuries of neglect. The remains of a plume's stub hang atop its rim."
	body_parts_covered = COVERAGE_HEAD
	max_integrity = ARMOR_INT_HELMET_HEAVY_DECREPIT
	icon_state = "ancientbarbute"
	material_category = ARMOR_MAT_PLATE
	anvilrepair = null
	worn_x_dimension = 64
	worn_y_dimension = 64
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi' //Uses the new 'greatplume + orle' system. If this glitches out, I made sure to include a fully-prepared 32x32 version - with details - in head.dmi.
	bloody_icon = 'icons/effects/blood64x64.dmi'
	item_weight = 2.4 KILOGRAMS

/obj/item/clothing/head/helmet/heavy/aalloy/attackby(obj/item/W, mob/living/user, params)
	. = ..()
	if(!istype(W, /obj/item/natural/feather) || detail_tag)
		return

	var/choice = tgui_input_list(user, "Choose a color.", "Uniform colors", GLOB.noble_dyes)
	if(!choice)
		return
	user.visible_message(span_warning("[user] adds [W] to [src]."))
	qdel(W)
	detail_color = GLOB.noble_dyes[choice]
	detail_tag = "_detail"
	update_appearance(UPDATE_ICON)

//............... Great Helm ............... //
/obj/item/clothing/head/helmet/heavy/bucket
	name = "great helm"
	desc = "An immovable bulwark of protection for the head of the faithful. Antiquated and impractical, but offering incredible defense."
	icon_state = "topfhelm"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

	armor_type = /datum/armor/head/plate
	prevent_crits = ALL_CRITICAL_HITS
	item_weight = 4.3 KILOGRAMS

/obj/item/clothing/head/helmet/heavy/bucket/keeper
	name = "keeper's stone mask"
	desc = "A hooded stone mask worn by Erdite keepers. Their face, oft marred by disease doth not hold value, for it is the pursuit of knowledge of the heartbeast that is the true cause."
	icon_state = "keeperhelm"
	item_state = "keeperhelm"
	// Best approximation for stone as we have no standard!
	armor_type = /datum/armor/head/plate
	armor_class = AC_LIGHT
	smeltresult = null

/obj/item/clothing/head/helmet/heavy/bucket/gold
	icon_state = "topfhelm_gold"
	item_weight = 8.6 KILOGRAMS

//............... Frog Helmet ............... //
/obj/item/clothing/head/helmet/heavy/frog
	name = "frog helmet"
	desc = "A thick, heavy helmet that severely obscures the wearer's vision. Still rather protective."
	icon_state = "froghelm"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

	armor_type = /datum/armor/head/plate/good
	prevent_crits = ALL_CRITICAL_HITS
	item_weight = 4.5 KILOGRAMS

//............... One Envy Frog Helmet ............... //

/obj/item/clothing/head/helmet/heavy/envy
	name = "darksteel frog helmet"
	adjustable = CAN_CADJUST
	icon_state = "zizofrogmouth"
	icon = 'icons/roguetown/clothing/special/evilarmor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/evilarmor.dmi'
	armor_type = /datum/armor/head/plate
	prevent_crits = ALL_CRITICAL_HITS
	item_weight = 4.5 KILOGRAMS
	block2add = FOV_BEHIND
	sellprice = 0 // Incredibly evil Zizoid armor, this should be burnt, nobody wants this

//............... Matthios Helmet ............... //

/obj/item/clothing/head/helmet/heavy/deceivers
	name = "gilded visage"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	desc = "A sinister visage. So that your crimes are never brought to you."
	icon_state = "matthioshelm"
	icon = 'icons/roguetown/clothing/special/evilarmor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/evilarmor64x64.dmi'
	armor_type = /datum/armor/head/plate
	prevent_crits = ALL_CRITICAL_HITS
	item_weight = 3.2 KILOGRAMS
	block2add = FOV_BEHIND
	sellprice = 0 // See above comment
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	worn_x_dimension = 64
	worn_y_dimension = 64

//............... Archdevil Helmet ............... //

/obj/item/clothing/head/helmet/heavy/archdevils
	name = "vicious helmet"
	desc = "A rugged and horrifying helmet. A violent aura emanates from it."
	icon_state = "graggarplatehelm"
	icon = 'icons/roguetown/clothing/special/evilarmor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/evilarmor.dmi'
	armor_type = /datum/armor/head/plate
	flags_cover = HEADCOVERSEYES
	prevent_crits = ALL_CRITICAL_HITS
	item_weight = 4.5 KILOGRAMS
	block2add = FOV_BEHIND
	sellprice = 0 // See above comment

//............... Baothan Helmet ............... //

/obj/item/clothing/head/helmet/heavy/hertannea
	name = "willful helmet"
	icon_state = "baothahelm"
	icon = 'icons/roguetown/clothing/special/baothanknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/evilarmor64x64.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	armor_type = /datum/armor/head/plate
	prevent_crits = ALL_CRITICAL_HITS
	item_weight = 4.5 KILOGRAMS
	block2add = FOV_BEHIND
	sellprice = 0 // See above comment

//............... Spangenhelm ............... //
/obj/item/clothing/head/helmet/heavy/viking
	name = "spangenhelm"
	desc = "A steel helmet with built-in eye and nose protection, commonly used by warriors of the north."
	icon_state = "Spangenhelm_item"
	item_state = "Spangenhelm_worn"
	icon = 'icons/roguetown/clothing/special/spangenhelm_item.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/spangenhelm_worn.dmi'
	body_parts_covered = HEAD|NOSE|EYES
	slot_flags = ITEM_SLOT_HEAD
	flags_inv = HIDEFACE|HIDEHAIR
	armor_type = /datum/armor/head/plate
	resistance_flags = FIRE_PROOF
	blocksound = PLATEHIT
	prevent_crits = ALL_CRITICAL_HITS
	item_weight = 2.6 KILOGRAMS
	clothing_flags = CANT_SLEEP_IN
	max_integrity = INTEGRITY_STRONGEST
	block2add = FOV_BEHIND

//............... Temple heavy helmets ......................//
//............... Visires Helmet ............... //
/obj/item/clothing/head/helmet/heavy/necked/visires
	name = "flame helm"
	desc = null
	icon_state = "astratahelm"
	item_weight = 5.5 KILOGRAMS

//............... Akan Helmet ............... //
/obj/item/clothing/head/helmet/heavy/necked/akan
	name = "air helm"
	desc = null
	icon_state = "nochelm"
	item_weight = 6 KILOGRAMS
	flags_inv = HIDEEARS

/obj/item/clothing/head/helmet/heavy/necked/akan/Initialize(mapload)
	. = ..()
	enchant(/datum/enchantment/silver)

//............... Valdala Helmet ............... //
/obj/item/clothing/head/helmet/heavy/necked/valdala
	name = "valdalan helmet"
	desc = "A reinforced helmet shaped into the visage of a skull with a maille neck cover under the cloth. A symbol of authority for the battle servants of the grieving angel."
	icon_state = "necrahelm"
	item_weight = 4.5 KILOGRAMS

//............... Gani Helmet ............... //	This one seems a bit out of place
/obj/item/clothing/head/helmet/heavy/necked/ganihelm
	name = "earthen helmet"
	desc = "A great helmet with twisted metalwork that imitates the twisting of bark, or the horns of a beast."
	icon_state = "dendorhelm"
	prevent_crits = ALL_EXCEPT_BLUNT
	item_weight = 4.5 KILOGRAMS

//............... Pomette Helmet ............... //
/obj/item/clothing/head/helmet/sallet/pomettic
	name = "pomette helmet"
	desc = "A standard helmet forged in the style typical of Pomettic worshippers, a simple yet practical protective piece of equipment. Upon it lays several laurels of flowers and other colorful ornaments, followed by several symbols and standards of the user's chapter, accomplishments or even punishment"
	icon_state = "eorahelm"
	item_state = "eorahelm"
	item_weight = 3.2 KILOGRAMS


//............... Erdl Helmet ............... //
/obj/item/clothing/head/helmet/heavy/necked/erdlhelm
	name = "erdite helmet"
	desc = "A great helmet made of coarse, tainted steel. It is modeled after a plagued carrion, a blessed abomination of Erdl."
	icon_state = "pestrahelm"
	item_state = "pestrahelm"
	item_weight = 4.5 KILOGRAMS

//................ Goler Kanh Helmet ............. //
/obj/item/clothing/head/helmet/heavy/necked/golerkanhhelm
	name = "kanhite helmet"
	desc = "A great helmet of sturdy dark steel. Its chiseled countenance reminds the viewer of Goler Kanh's stern gaze."
	icon_state = "malumhelm"
	item_state = "malumhelm"
	item_weight = 4.5 KILOGRAMS

/obj/item/clothing/head/helmet/heavy/necked/mordsol
	name = "mordsolian helmet"
	desc = "Headwear commonly worn by Templars in service to Mordsol. It resembles a heavily-adorned visored sallet."
	icon_state = "ravoxhelm"
	item_state = "ravoxhelm"
	item_weight = 4.5 KILOGRAMS

//................ Iliope Helmet ............. //
/obj/item/clothing/head/helmet/heavy/necked/iliope
	name = "fools helmet"
	desc = "A great helmet forged from steel, and fashioned in the visage of a jester, jingling bells and all. Commonly worn by Templars in service to Iliope"
	icon_state = "xylixhelm"
	item_state = "xylixhelm"
	item_weight = 4.5 KILOGRAMS

/obj/item/clothing/head/helmet/heavy/necked/iliope/Initialize()
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, custom_sounds = list(SFX_JINGLE_BELLS))

//................ Mjallidhorn Helmet ............. //
/obj/item/clothing/head/helmet/heavy/necked/mjallidhorn
	name = "mjallidhorn helmet"
	desc = "A great helmet crafted from bronze. The visor is slitted and ridged, evoking the gills of a great sea-beast."
	icon_state = "abyssorhelm"
	item_state = "abyssorhelm"
	item_weight = 5.5 KILOGRAMS

//................ Deep Abyssor Helmet ............. //
/obj/item/clothing/head/helmet/heavy/necked/deepabyssor
	name = "deep abyssor helmet"
	desc = "A great helmet crafted from bronze. The visor is slitted and ridged, evoking the gills of a great sea-beast. May His name be remembered..."
	icon_state = "deepabyssorhelm"
	item_state = "deepabyssorhelm"
	item_weight = 5.5 KILOGRAMS
	melting_material = /datum/material/bronze

//............... Sinistar (Graggar) Helmet ............... //
/obj/item/clothing/head/helmet/heavy/sinistar
	name = "sinistar helmet"
	desc = "Glorious star, smeared in guts and greeted with a chorus of howls."
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	worn_x_dimension = 64
	worn_y_dimension = 64
	icon_state = "sinistarhelm"
	dropshrink = 0.9
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	melt_amount = 75
	melting_material = /datum/material/steel
	item_weight = 4.45 KILOGRAMS

/obj/item/clothing/head/helmet/heavy/decorated	// template
	abstract_type = /obj/item/clothing/head/helmet/heavy/decorated
	name = "a template"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	worn_x_dimension = 64
	worn_y_dimension = 64
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	sellprice = VALUE_STEEL_HELMET+BONUS_VALUE_TINY
	prevent_crits = ALL_CRITICAL_HITS
	var/picked = FALSE

//............... Decorated Knight Helmet ............... //
/obj/item/clothing/head/helmet/heavy/decorated/knight
	name = "knights helmet"
	desc = "A lavish knights helmet which allows a crest to be mounted on top."
	icon_state = "decorated_knight"
	item_weight = 4.45 KILOGRAMS

/obj/item/clothing/head/helmet/heavy/decorated/knight/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(!picked)
		var/list/icons = HELMET_KNIGHT_DECORATIONS
		var/choice = tgui_input_list(user, "Choose a crest.", "Knightly crests", icons)
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_appearance(UPDATE_ICON)
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

//............... Decorated Hounskull ............... //
/obj/item/clothing/head/helmet/heavy/decorated/hounskull
	name = "hounskull"
	desc = "A lavish hounskull which allows a crest to be mounted on top."
	icon_state = "decorated_hounskull"
	armor_type = /datum/armor/head/plate/good
	max_integrity = INTEGRITY_STRONG
	prevent_crits = ALL_CRITICAL_HITS
	item_weight = 4.45 KILOGRAMS


/obj/item/clothing/head/helmet/heavy/decorated/hounskull/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(!picked)
		var/list/icons = HELMET_HOUNSKULL_DECORATIONS
		var/choice = tgui_input_list(user, "Choose a crest.", "Knightly crests", icons)
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_appearance(UPDATE_ICON)
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

//............... Decorated Great Helm ............... //
/obj/item/clothing/head/helmet/heavy/decorated/bucket
	name = "great helm"
	desc = "A lavish great helm which allows a crest to be mounted on top."
	icon_state = "decorated_bucket"
	prevent_crits = ALL_CRITICAL_HITS
	item_weight = 3.5 KILOGRAMS

/obj/item/clothing/head/helmet/heavy/decorated/bucket/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(!picked)
		var/list/icons = HELMET_BUCKET_DECORATIONS
		var/choice = tgui_input_list(user, "Choose a crest.", "Knightly crests", icons)
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_appearance(UPDATE_ICON)
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

//............... Decorated Gold Helm ............... //
/obj/item/clothing/head/helmet/heavy/decorated/golden
	name = "gold helm"
	desc = "A lavish gold-trimmed greathelm which allows a crest to be mounted on top."
	icon_state = "decorated_gbucket"
	prevent_crits = ALL_CRITICAL_HITS
	item_weight = 4 KILOGRAMS

/obj/item/clothing/head/helmet/heavy/decorated/golden/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(!picked)
		var/list/icons = HELMET_GOLD_DECORATIONS
		var/choice = tgui_input_list(user, "Choose a crest.", "Knightly crests", icons)
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_appearance(UPDATE_ICON)
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/clothing/head/helmet/heavy/decorated/bascinet
	name = "bascinet"
	desc = "A simple steel helmet that can be decorated with a crest. Somewhat basic, but you'll be the envy of those who cannot afford such a fancy helmet."
	icon_state = "decorated_bascinet"
	flags_inv = HIDEEARS
	sellprice = VALUE_STEEL_HELMET
	equip_delay_self = 2 SECONDS
	unequip_delay_self = 2 SECONDS
	block2add = null

	body_parts_covered = HEAD|HAIR|EARS
	item_weight = 3.25 KILOGRAMS

/obj/item/clothing/head/helmet/heavy/decorated/bascinet/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(!picked)
		var/list/icons = BASCINET_DECORATIONS
		var/choice = tgui_input_list(user, "Choose a crest.", "Knightly crests", icons)
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_appearance(UPDATE_OVERLAYS)
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/clothing/head/helmet/heavy/ordinatorhelm
	name = "inquisitorial ordinator's helmet"
	desc = "A design suggested by a Aelondan smith, inspired by an eccentric count who insisted on sleeping in a coffin. A steel casket with thin slits that allow for deceptively clear vision. The tainted will drown in the blood you bring their way, while this high helm keeps it out of your face."
	icon_state = "ordinatorhelm"
	item_state = "ordinatorhelm"
	worn_x_dimension = 64
	worn_y_dimension = 64
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood64x64.dmi'
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	adjustable = CAN_CADJUST
	block2add = FOV_BEHIND
	max_integrity = 350
	var/plumed = FALSE

/obj/item/clothing/head/helmet/heavy/ordinatorhelm/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if(!istype(tool, /obj/item/natural/feather))
		return NONE

	user.visible_message(span_warning("[user] starts to fashion plumage using [tool] for [src]."))
	if(do_after(user, 4 SECONDS))
		var/obj/item/clothing/head/helmet/heavy/ordinatorhelm/plume/P = new(get_turf(user))
		if(user.is_holding(src))
			user.dropItemToGround(src)
			user.put_in_hands(P)
		P.update_integrity(get_integrity())
		qdel(src)
		qdel(tool)

	return ITEM_INTERACT_SUCCESS

/obj/item/clothing/head/helmet/heavy/ordinatorhelm/plume
	icon_state = "ordinatorhelmplume"
	item_state = "ordinatorhelmplume"

/obj/item/clothing/head/helmet/heavy/ordinatorhelm/plume/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	return NONE

/obj/item/clothing/head/helmet/heavy/absolver
	name = "katholikon conical helm"
	desc = "Its shape confounds and confuses the enemies of the Katholikon. Offering unfound protection in its visage, the gaze is horrific to those without understanding."
	icon_state = "absolutionisthelm"
	item_state = "absolutionisthelm"
	block2add = null
	body_parts_covered = FULL_HEAD|NECK
	max_integrity = 450 // Worst vision. Yes.
	worn_x_dimension = 64
	worn_y_dimension = 64
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood64x64.dmi'
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	clothing_flags = NONE
	melting_material = /datum/material/silver

/obj/item/clothing/head/helmet/heavy/psybucket
	name = "katholikon bucket helmet"
	desc = "Originally just a bucket with an amulet nailed on, it proved surprisingly effective, making its way into common use for Inquisitorial templars. Steel encapsulates your head, and the amulet facing enemies reminds them that you will endure until they meet oblivion. Only then may you rest."
	icon_state = "psybucket"
	item_state = "psybucket"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	adjustable = CAN_CADJUST
	block2add = FOV_BEHIND
	max_integrity = 400
	melting_material = /datum/material/silver

/obj/item/clothing/head/helmet/heavy/psysallet
	name = "katholikon sallet"
	desc = "A boiled leather cap, crowned with steel and veiled with an amulet. Fear not - the Four and One will show you the way, and They will see your blows well-struck."
	icon_state = "psysallet"
	item_state = "psysallet"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	adjustable = CAN_CADJUST
	block2add = FOV_BEHIND
	max_integrity = 400
	melting_material = /datum/material/silver

//............... Gronn Heavy Helmet ...............//
/obj/item/clothing/head/helmet/heavy/ironplate/gronn
	name = "nortic horned helmet"
	desc = "A horned helms of solid iron. \
		A suitable replacement for the precious skull-helms worn in Nortmidst. \
		For of course, to have your skull-helm smashed is the highest of disrespects."
	icon = 'icons/roguetown/clothing/special/gronn.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/gronn.dmi'
	bloody_icon = 'icons/effects/blood64x64.dmi'
	icon_state = "gronnplatehelm"
	item_state = "gronnplatehelm"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_BEHIND
	worn_x_dimension = 64
	worn_y_dimension = 64
