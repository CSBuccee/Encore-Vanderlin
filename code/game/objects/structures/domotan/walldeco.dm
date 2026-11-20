//Separate file to reduce conflicts
/obj/structure/fluff/walldeco/banner
	name = "shirleigh flag"
	desc = "A banner in the standard decorum of the Shirleighs, blue as sky and white as the stars it hides."
	icon = 'icons/roguetown/misc/domotan/decoration.dmi'
	icon_state = "wallflag"

//Meant to change according to whatever regent is actually in charge
/obj/structure/fluff/walldeco/customflag/regent
	name = "regent flag"
	desc = "A Shirleighan house banner, indicating the standard of the current standing regent."
	icon = 'icons/roguetown/misc/domotan/decoration.dmi'
	icon_state = "wallflag"
	uses_lord_coloring = LORD_PRIMARY | LORD_SECONDARY

/obj/structure/fluff/walldeco/churchbanner
	name = "katholikos banner"
	desc = "A proud banner demarking the territory of the Katholikos. Elementalists wander these parts."
	icon = 'icons/roguetown/misc/domotan/decoration.dmi'
	icon_state = "church-purple"

/obj/structure/fluff/walldeco/churchbanner/red
	icon_state = "church-red"

/obj/structure/fluff/walldeco/churchbanner/jealousgod
	name = "sigil of the One Envy"
	desc = "A roughened banner, in its age it still proudly bears the symbolism of the One Envy. It urges you to not look away."
	icon_state = "envy"

/obj/item/painting/vamp
	name = "painting of Vilhelm Dragowyla"
	desc = "An ancient portrait of a menacing man. He looks quite lively."
	icon = 'icons/roguetown/misc/domotan/painting_vamp.dmi'
	icon_state = "painting_vamp1"
	sellprice = 90
	deployed_structure = /obj/structure/fluff/walldeco/painting/vamp

/obj/structure/fluff/walldeco/painting/vamp
	name = "painting of Vilhelm Dragowyla"
	desc = "An ancient portrait of a menacing man. He looks quite lively."
	icon = 'icons/roguetown/misc/domotan/painting_vamp.dmi'
	icon_state = "painting_vamp1_deployed"
	stolen_painting = /obj/item/painting/vamp

/obj/item/painting/vamp/two
	name = "painting of Ion Dragowyla"
	desc = "An ancient portrait of time-forgotten lord."
	icon_state = "painting_vamp2"
	deployed_structure = /obj/structure/fluff/walldeco/painting/vamp/two

/obj/structure/fluff/walldeco/painting/vamp/two
	name = "painting of Ion Dragowyla"
	desc = "An ancient portrait of time-forgotten lord."
	icon_state = "painting_vamp2_deployed"
	stolen_painting = /obj/item/painting/vamp/two

/obj/item/painting/vamp/three
	name = "painting of Ursula Dragowyla"
	desc = "An ancient portrait of a raven-haired woman."
	icon_state = "painting_vamp3"
	deployed_structure = /obj/structure/fluff/walldeco/painting/vamp/three

/obj/structure/fluff/walldeco/painting/vamp/three
	name = "painting of Ursula Dragowyla"
	desc = "An ancient portrait of a raven-haired woman."
	icon_state = "painting_vamp3_deployed"
	stolen_painting = /obj/item/painting/vamp/three

/obj/item/painting/vamp/four
	name = "painting of Anton Dragowyla"
	desc = "An ancient portrait of time-forgotten lord."
	icon_state = "painting_vamp4"
	deployed_structure = /obj/structure/fluff/walldeco/painting/vamp/four

/obj/structure/fluff/walldeco/painting/vamp/four
	name = "painting of Anton Dragowyla"
	desc = "An ancient portrait of time-forgotten lord."
	icon_state = "painting_vamp4_deployed"
	stolen_painting = /obj/item/painting/vamp/four
