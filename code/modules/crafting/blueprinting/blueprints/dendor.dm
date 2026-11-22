/datum/blueprint_recipe/gani
	craftdiff = 0
	category = "Gani Shrine"
	requires_learning = TRUE
	construct_tool = null

/datum/blueprint_recipe/gani/shrine
	name = "growing shrine to Gani (unique)"
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/thorn = 3,
				/obj/item/natural/head/gote = 1)
	result_type = /obj/structure/fluff/psycross/crafted/shrine/gani_gote
	verbage = "consecrate"
	verbage_tp = "consecrates"
	craftsound = 'sound/foley/Building-01.ogg'

/datum/blueprint_recipe/gani/shrine/saiga
	name = "stinging shrine to Gani (unique)"
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/thorn = 3,
				/obj/item/natural/head/saiga = 1)
	result_type = /obj/structure/fluff/psycross/crafted/shrine/gani_saiga

/datum/blueprint_recipe/gani/shrine/volf
	name = "devouring shrine to Gani (unique)"
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/thorn = 3,
				/obj/item/natural/head/volf = 1)
	result_type = /obj/structure/fluff/psycross/crafted/shrine/gani_volf

/datum/blueprint_recipe/gani/shrine/troll
	name = "lording shrine to Gani (unique)"
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/thorn = 3,
				/obj/item/natural/head/troll = 1)
	result_type = /obj/structure/fluff/psycross/crafted/shrine/gani_troll

/datum/blueprint_recipe/topiary
	name = "topiary saiga"
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/thorn = 2,
				/obj/item/natural/fibers = 3)
	construct_tool = /obj/item/weapon/knife/scissors
	result_type = /obj/structure/fluff/statue/topiary/saiga

/datum/blueprint_recipe/topiary/sphere
	name = "topiary sphere"
	result_type = /obj/structure/fluff/statue/topiary/sphere

/datum/blueprint_recipe/topiary/spiral
	name = "topiary spiral"
	result_type = /obj/structure/fluff/statue/topiary/spiral

/datum/blueprint_recipe/topiary/stack
	name = "topiary stack"
	result_type = /obj/structure/fluff/statue/topiary/stack

/datum/blueprint_recipe/topiary/spear
	name = "topiary spear"
	result_type = /obj/structure/fluff/statue/topiary/spear

/datum/blueprint_recipe/topiary/man
	name = "topiary man"
	result_type = /obj/structure/fluff/statue/topiary/man

/datum/blueprint_recipe/topiary/man/flowers
	name = "topiary man with flowers"
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/thorn = 2,
				/obj/item/natural/fibers = 3,
				/obj/item/alch/herb/salvia = 1,
				/obj/item/alch/herb/matricaria = 1,)
	result_type = /obj/structure/fluff/statue/topiary/man/flowers

/datum/blueprint_recipe/topiary/bunny
	name = "topiary bunny"
	result_type = /obj/structure/fluff/statue/topiary/bunny

/datum/blueprint_recipe/topiary/bunny/flowers
	name = "topiary bunny with flowers"
	required_materials = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/thorn = 2,
				/obj/item/natural/fibers = 3,
				/obj/item/alch/herb/salvia = 1,
				/obj/item/alch/herb/matricaria = 1,)
	result_type = /obj/structure/fluff/statue/topiary/bunny/flowers
