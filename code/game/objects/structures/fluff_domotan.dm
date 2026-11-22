/obj/structure/fluff/statue/one_envy
	name = "statue of the One Envy"
	desc = "Burning eyes of amber pierce through you; they see what is truly you, more than one's mind can possibly know itself. You dare not stir its gaze."
	icon = 'icons/roguetown/misc/32x64.dmi'
	icon_state = "off"
	max_integrity = 500
	deconstructible = FALSE
	density = TRUE
	blade_dulling = DULLING_BASH

/obj/structure/fluff/statue/one_envy/Initialize()
	. = ..()
	set_light(1, 1, 1, l_color = COLOR_ORANGE)

/obj/structure/fluff/statue/hand_of_fate
	name = "Mighty Hand of Fate"
	desc = "Exuberance and untold luxury survives a mythos long since erased from the annals of beastkind's history. Yet Her glorious facsimile lives on, stronger still in this lonesome, isolated place. Her home. Her love. Her final gift. Fate errs at the unrelenting hand of its master!"
	icon = 'icons/roguetown/misc/64x96.dmi'
	icon_state = "hand"
	max_integrity = 10000
	deconstructible = FALSE
	density = TRUE
	blade_dulling = DULLING_BASH
	bound_width = 64

/obj/structure/fluff/statue/hand_of_fate/Initialize()
	. = ..()
	set_light(1, 1, 1, l_color = COLOR_ORANGE)

/obj/structure/fluff/statue/droid
	name = "Kraf Dol"
	desc = "A peculiar machina of unknown make, firmly embedded in the wall and gleaming out with tiny lifeless ocular holes. It hums with a mysterious energy."
	icon = 'icons/roguetown/misc/droids.dmi'
	icon_state = "kraf_on"
	max_integrity = 100
	deconstructible = FALSE
	density = FALSE
	blade_dulling = DULLING_BASH

/obj/structure/fluff/statue/droid/Initialize()
	. = ..()
	set_light(1, 1, 1, l_color = COLOR_BLUE_LIGHT)

/obj/structure/fluff/statue/droid/attackby(obj/item/P, mob/user, params)
	say("Shzzt! Krrf, krrchst zaak! Mana barrier intact. Sea pressure nominal. Shhhtz.")
	return

/obj/structure/fluff/hanging_banners
	name = "hanging pennant flags"
	desc = "Free-flying little banners in the standard decorum of the Shirleighs, blue as sky and white as the stars it hides."
	icon = 'icons/roguetown/misc/flags.dmi'
	icon_state = "banners_doma"
	max_integrity = 20
	layer = 9
	deconstructible = FALSE
	density = FALSE
	blade_dulling = DULLING_BASH

/obj/structure/fluff/hanging_banners/church
	name = "elementalist pennant flags"
	desc = "Free-flying little banners in the standard decorum of the Elemental pantheon. It represents an order of Fire, Ice, Earth and Air."
	icon_state = "banners_church"

/obj/structure/fluff/flag
	name = "Shirleigh flag"
	desc = "A proud flag full of wind in the standard decorum of the Shirleighs, blue as sky and white as the stars it hides."
	icon = 'icons/roguetown/misc/96x96.dmi'
	icon_state = "flag_doma"
	max_integrity = 300
	layer = 9
	deconstructible = FALSE
	density = TRUE
	blade_dulling = DULLING_BASH
	SET_BASE_PIXEL(-32, 0)

/obj/structure/fluff/psycross/hugecrystal
	name = "Restrained Elemental Shard"
	desc = "A towering, shimmering crystal. It appears to be restrained with some odd advanced mechanism, hindering its power from being channeled."
	icon_state = "caged"
	icon = 'icons/roguetown/misc/64x96.dmi'
	break_sound = 'sound/combat/hits/onglass/glassbreak (2).ogg'
	attacked_sound = list('sound/combat/hits/onglass/glassbreak (1).ogg','sound/combat/hits/onglass/glassbreak (3).ogg')
	layer = ABOVE_MOB_LAYER
	max_integrity = 600
	deconstructible = FALSE
	SET_BASE_PIXEL(-16, 0)

/obj/structure/fluff/psycross/hugecrystal/Initialize()
	. = ..()
	set_light(1, 1, 1, l_color = COLOR_BLUE_LIGHT)

/obj/structure/fluff/psycross/hugecrystal/dead
	name = "Lifeless Elemental Shard"
	desc = "A towering, shimmering crystal. It appears to be devoid of energy and shows no sign of power within."
	icon_state = "dead"

//Elemental crystal for the church
//destroying it causes a huge explosion and an omen
/obj/structure/fluff/psycross/hugecrystal/unsafe
	name = "Linked Elemental Shard"
	desc = "A towering, glamorous and lively crystal. A priceless treasure and fixture of worship for disciples of the Elementals, and said to be but a tiny fraction of Heaven brought to Gaia."
	icon_state = "free"

/obj/structure/fluff/psycross/hugecrystal/unsafe/Destroy()
	addomen("psycross")
	STOP_PROCESSING(SSfastprocess, src)
	var/turf/T = get_turf(src)
	explosion(T, devastation_range = 2, heavy_impact_range = 3, light_impact_range = 7, flash_range = 9, flame_range = 7, smoke = TRUE, soundin = 'sound/misc/explode/incendiary (2).ogg')
	return ..()

/obj/structure/fluff/railing/tall/retaining
	name = "wooden retaining wall"
	desc = "A sturdy earthen reinforcement of wooden planks."
	icon = 'icons/roguetown/misc/retainingwall.dmi'
	icon_state = "wall"
	pass_throwing = TRUE
	SET_BASE_PIXEL(0, 0)
	max_integrity = 400

/obj/structure/fluff/railing/tall/retaining/Initialize()
	. = ..()
	layer = ABOVE_MOB_LAYER + 0.015//should cover the water edge effects

/obj/structure/fluff/railing/tall/retaining/stone
	name = "stone retaining wall"
	desc = "A strong ledge of aged, downtrodden stones."
	icon_state = "wallstone"
	max_integrity = 1600

/obj/structure/fluff/railing/tall/retaining/rock
	name = "rock ledge"
	desc = "A ledge of crumbling stones resembling a tiny cliff."
	icon = 'icons/roguetown/misc/domotan/rock_ledge.dmi'
	icon_state = "wallrock"
	max_integrity = 5000
	SET_BASE_PIXEL(-8, -4)

/obj/structure/fluff/railing/tall/retaining/concrete
	name = "concrete ledge"
	desc = "A concrete footer of substantial height, resembling a ledge."
	icon_state = "wallconcrete"
	max_integrity = 5000

/obj/structure/fluff/road_sign
	name = "road sign"
	desc = "A tall fixture upon a pole with writing that depicts where and what the road leads to. This one only goes one direction."
	icon = 'icons/roguetown/misc/road_signs.dmi'
	icon_state = "sign_1d"
	max_integrity = 150
	layer = 9
	deconstructible = FALSE
	density = TRUE
	blade_dulling = DULLING_BASH

/obj/structure/fluff/road_sign/two_directions
	desc = "A tall fixture upon a pole with writing that depicts where and what the road leads to. This one goes two directions."
	icon_state = "sign_2d"

/obj/structure/fluff/road_sign/three_directions
	desc = "A tall fixture upon a pole with writing that depicts where and what the road leads to. This one goes three directions."
	icon_state = "sign_3d"

/obj/structure/fluff/road_sign/four_directions
	desc = "A tall fixture upon a pole with writing that depicts where and what the road leads to. This one goes four directions."
	icon_state = "sign_4d"

/obj/structure/fluff/road_sign/corner
	desc = "A tall fixture upon a pole with writing that depicts where and what the road leads to. This one goes two directions and indicates a corner."
	icon_state = "sign_corner"

/obj/structure/fluff/walldeco/smugglerflag
	name = "missing canaries ward"
	desc = "A cautionary warding reminding quite urgently that you are in bad company. It has a crude, crimson sigil of a stout bird."
	icon = 'icons/roguetown/misc/domotan/structure.dmi'
	icon_state = "canary"

/obj/structure/fluff/walldeco/smugglersigil
	name = ""
	desc = ""
	icon = 'icons/roguetown/misc/domotan/structure.dmi'
	icon_state = "canary_sigil"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/fluff/pipe_organ
	name = "massive pipe organ"
	desc = "A gigantic musical instrument that metaphorically screams wealth and luxury. It commands a certain spiritual authority about the room. In its center face is a Shirleighan emblem."
	icon = 'icons/roguetown/misc/domotan/96x96.dmi'
	icon_state = "organ"
	max_integrity = 600
	density = TRUE
	deconstructible = FALSE
	SET_BASE_PIXEL(-16, 0)

/obj/structure/fluff/banner
	name = "aelondan standard"
	desc = "The purple standard of the good kingdom, Aelonda. It lacks much decorum."
	icon = 'icons/roguetown/misc/domotan/banners.dmi'
	icon_state = "aelonda"
	layer = ABOVE_OBJ_LAYER
	anchored = TRUE
	density = TRUE
	deconstructible = FALSE

/obj/structure/fluff/banner/regal
	desc = "The purple standard of the good kingdom, Aelonda. It is an especially gilded flag, likely indicating the presence of someone or something important."
	icon_state = "aelonda_regal"

/obj/structure/fluff/banner/cudao
	name = "cudese standard"
	desc = "The cloud-white standard of the eastern nation of Cudao. It lacks much decorum."
	icon_state = "cudao"

/obj/structure/fluff/banner/cudao/regal
	desc = "The cloud-white standard of the eastern nation of Cudao. It is an especially gilded flag, likely indicating the presence of someone or something important."
	icon_state = "cudao_regal"

/obj/structure/fluff/banner/geramor
	name = "gernish standard"
	desc = "The orange standard of the broken kingdom of Cudao. It lacks much decorum."
	icon_state = "geramor"

/obj/structure/fluff/banner/geramor/regal
	desc = "The orange standard of the broken kingdom of Cudao. It is an especially gilded flag, likely indicating the presence of someone or something important."
	icon_state = "geramor_regal"

/obj/structure/fluff/banner/noma
	name = "noman standard"
	desc = "The green standard of the traveling country of Noma. It lacks much decorum."
	icon_state = "noma"

/obj/structure/fluff/banner/noma/regal
	desc = "The green standard of the traveling country of Noma. It is an especially gilded flag, likely indicating the presence of someone or something important."
	icon_state = "noma_regal"

/obj/structure/fluff/banner/qadirid
	name = "burning banner"
	desc = "The Burning Banner itself. Somehow, this example lacks much decorum."
	icon_state = "qadirid"

/obj/structure/fluff/banner/qadirid/regal
	desc = "The Burning Banner itself. It is an especially gilded flag, likely indicating the presence of someone or something important."
	icon_state = "qadirid_regal"

/obj/structure/fluff/banner/nortmidst
	name = "nortic standard"
	desc = "The standard of the unified tribes of the Nortics, representing at least some sort of union of interests between them nearby."
	icon_state = "nortmidst"
