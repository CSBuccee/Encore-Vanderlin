
/datum/blueprint_recipe/carpentry
	abstract_type = /datum/blueprint_recipe/carpentry
	skillcraft = /datum/attribute/skill/craft/carpentry
	category = "Carpentry"
	construct_tool = /obj/item/weapon/hammer
	craftsound = 'sound/foley/Building-01.ogg'
	verbage = "build"
	verbage_tp = "builds"
	edge_density = FALSE

/datum/blueprint_recipe/carpentry/barrel
	name = "wooden barrel"
	desc = "A sturdy wooden barrel for fermentation."
	result_type = /obj/structure/fermentation_keg
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	craftdiff = 0

/datum/blueprint_recipe/carpentry/door
	name = "wooden door"
	desc = "A basic wooden door."
	result_type = /obj/structure/door
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	supports_directions = TRUE
	craftdiff = 0
	build_time = 4 SECONDS

/datum/blueprint_recipe/carpentry/swing_door
	name = "swing door"
	desc = "A door that swings both ways."
	result_type = /obj/structure/door/swing
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/fish_mount
	name = "Fish Mount"
	desc = "Wooden mount to showoff your fish."
	result_type = /obj/structure/fish_mount
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	category = "Wall Fixtures"
	floor_object = FALSE
	check_adjacent_wall = TRUE
	supports_directions = TRUE
	place_on_wall = TRUE


/datum/blueprint_recipe/carpentry/deadbolt_door
	name = "wooden door (deadbolt)"
	desc = "A reinforced wooden door with a deadbolt."
	result_type = /obj/structure/door/weak/bolt
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/grown/log/tree/stick = 1
	)
	supports_directions = TRUE
	craftdiff = 1
	build_time = 4 SECONDS

/datum/blueprint_recipe/carpentry/viewport_door
	name = "wooden door (viewport)"
	desc = "A wooden door with an iron viewport."
	result_type = /obj/structure/door/viewport
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/ingot/iron = 1
	)
	supports_directions = TRUE
	craftdiff = 2
	build_time = 4 SECONDS

/datum/blueprint_recipe/carpentry/fancy_door
	name = "fancy wooden door"
	desc = "An ornately crafted wooden door."
	result_type = /obj/structure/door/fancy
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	supports_directions = TRUE
	craftdiff = 3
	build_time = 4 SECONDS

/datum/blueprint_recipe/carpentry/bin
	name = "wooden bin"
	desc = "A simple wooden storage bin."
	result_type = /obj/item/bin
	required_materials = list(/obj/item/grown/log/tree/small = 2)
	craftdiff = 0

/datum/blueprint_recipe/carpentry/chair
	name = "wooden chair"
	desc = "A basic wooden chair."
	result_type = /obj/structure/chair/wood/alt/chair3/crafted
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/chairwood
	name = "fancy wooden chair"
	desc = "A basic wooden chair."
	result_type = /obj/structure/chair/wood
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/chair
	name = "alternate wooden chair"
	desc = "A basic wooden chair."
	result_type = /obj/structure/chair/wood/alt
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/fancy_chair
	name = "fancy wooden chair"
	desc = "An elegant wooden chair with silk upholstery."
	result_type = /obj/structure/chair/wood/alt/fancy/crafted
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/silk = 1
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/stool
	name = "wooden stool"
	desc = "A simple wooden stool."
	result_type = /obj/structure/chair/stool/crafted
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/stool/bar
	name = "barstool"
	desc = "Stool with a cloth cushion."
	result_type = /obj/structure/chair/stool/bar
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/cloth = 1
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/loom
	name = "loom"
	desc = "A weaving loom for creating textiles."
	result_type = /obj/machinery/loom
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/fibers = 2
	)
	supports_directions = TRUE
	craftdiff = 1

/datum/blueprint_recipe/carpentry/lantern_post
	name = "lantern post"
	desc = "A tall wooden post for mounting lanterns."
	result_type = /obj/machinery/light/fueled/lanternpost/unfixed
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/grown/log/tree/stick = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_cross
	name = "wooden cross"
	desc = "A religious wooden cross."
	result_type = /obj/structure/fluff/psycross/crafted
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/grown/log/tree/stake = 3
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/decorative_arch
	name = "wooden decorative arch"
	desc = "A wooden decorative arch intended to complement a table or worktop while preventing intrusion."
	result_type = /obj/structure/bars/wooden_arch
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/pyre
	name = "wooden pyre"
	desc = "A wooden funeral pyre."
	result_type = /obj/machinery/light/fueled/campfire/pyre
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/grown/log/tree/stake = 3
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/angros_wooden_cross
	name = "wooden psycross"
	desc = "A wooden psycross dedicated to Angros."
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/grown/log/tree/stake = 3
	)
	result_type = /obj/structure/fluff/psycross/angros
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_stairs_down
	name = "wooden stairs (down)"
	desc = "Wooden stairs leading downward."
	result_type = /obj/structure/stairs/d
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/wood/plank = 2
	)
	supports_directions = TRUE
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_stairs_down/check_craft_requirements(mob/user, turf/T, obj/structure/blueprint/blueprint)
	var/turf/partner = get_step_multiz(get_turf(blueprint), turn(blueprint.blueprint_dir, 180)|DOWN)
	if(!isopenturf(partner))
		to_chat(user, span_warning("Need an openspace at the turf below!"))
		return FALSE
	. = ..()

/datum/blueprint_recipe/carpentry/railing
	name = "railing"
	desc = "A wooden safety railing."
	result_type = /obj/structure/fluff/railing/wood
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/palisade
	name = "palisade"
	desc = "A wooden defensive palisade."
	result_type = /obj/structure/fluff/railing/tall/palisade
	required_materials = list(/obj/item/grown/log/tree/stake = 2)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/fence
	name = "fence"
	desc = "A tall wooden fence."
	result_type = /obj/structure/fluff/railing/tall
	required_materials = list(/obj/item/grown/log/tree/small = 1, /obj/item/natural/wood/plank = 2)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/chest
	name = "chest"
	desc = "A wooden storage chest."
	result_type = /obj/structure/closet/crate/chest/crafted
	required_materials = list(
		/obj/item/grown/log/tree/stake = 1,
		/obj/item/grown/log/tree/small = 2
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/closet
	name = "closet"
	desc = "A wooden storage closet."
	result_type = /obj/structure/closet/crate/crafted_closet/crafted
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/wood/plank = 1
	)
	supports_directions = TRUE
	craftdiff = 1

/datum/blueprint_recipe/carpentry/coffin
	name = "wooden coffin"
	desc = "A wooden burial coffin."
	result_type = /obj/structure/closet/crate/coffin
	required_materials = list(/obj/item/natural/wood/plank = 3)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/hay_bed
	name = "hay bed"
	desc = "A simple bed stuffed with hay."
	result_type = /obj/structure/bed/hay
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/needle // Special case - needs sewing
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/wool_bed
	name = "wool bed"
	desc = "A comfortable bed with wool stuffing."
	result_type = /obj/structure/bed/wool
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/needle // Special case - needs sewing
	supports_directions = TRUE
	craftdiff = 4

/datum/blueprint_recipe/carpentry/double_wool_bed
	name = "double wool bed"
	desc = "A large double bed with wool stuffing."
	result_type = /obj/structure/bed/wool/double
	required_materials = list(
		/obj/item/natural/wood/plank = 3,
		/obj/item/natural/cloth = 3
	)
	construct_tool = /obj/item/needle // Special case - needs sewing
	supports_directions = TRUE
	craftdiff = 4

/datum/blueprint_recipe/carpentry/nice_bed
	name = "nice bed"
	desc = "A luxurious bed with fur coverings."
	result_type = /obj/structure/bed
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
		/obj/item/natural/cloth = 2,
		/obj/item/natural/fur = 1
	)
	construct_tool = /obj/item/needle // Special case - needs sewing
	supports_directions = TRUE
	craftdiff = 5

/datum/blueprint_recipe/carpentry/inn_bed
	name = "nice bed without sheets"
	desc = "A quality bed frame without bedding."
	result_type = /obj/structure/bed/inn
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
		/obj/item/natural/cloth = 2,
		/obj/item/natural/fur = 1
	)
	construct_tool = /obj/item/needle // Special case - needs sewing
	supports_directions = TRUE
	craftdiff = 5

/datum/blueprint_recipe/carpentry/double_inn_bed
	name = "double nice bed"
	desc = "A large quality bed frame."
	result_type = /obj/structure/bed/inn/double
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
		/obj/item/natural/cloth = 4,
		/obj/item/natural/fur = 2
	)
	construct_tool = /obj/item/needle // Special case - needs sewing
	supports_directions = TRUE
	craftdiff = 5

/datum/blueprint_recipe/carpentry/custom_sign
	name = "custom sign"
	desc = "A wooden sign for custom messages."
	result_type = /obj/structure/fluff/customsign
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/wood/plank = 1
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/training_dummy
	name = "training dummy"
	desc = "A practice dummy for combat training."
	result_type = /obj/structure/fluff/statue/tdummy
	required_materials = list(
		/obj/item/natural/wood/plank = 1,
		/obj/item/grown/log/tree/small = 1,
		/obj/item/grown/log/tree/stick = 1
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/display_stand
	name = "display stand"
	desc = "A stand for displaying items."
	result_type = /obj/structure/mannequin
	required_materials = list(
		/obj/item/natural/wood/plank = 1,
		/obj/item/grown/log/tree/small = 1,
		/obj/item/grown/log/tree/stick = 3
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/female_mannequin
	name = "female mannequin"
	desc = "A female display mannequin."
	result_type = /obj/structure/mannequin/male/female
	required_materials = list(
		/obj/item/natural/wood/plank = 1,
		/obj/item/grown/log/tree/small = 1,
		/obj/item/ingot/iron = 1,
		/obj/item/natural/cloth = 1
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/male_mannequin
	name = "male mannequin"
	desc = "A male display mannequin."
	result_type = /obj/structure/mannequin/male
	required_materials = list(
		/obj/item/natural/wood/plank = 1,
		/obj/item/grown/log/tree/small = 1,
		/obj/item/ingot/iron = 1,
		/obj/item/natural/cloth = 1
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/wall_ladder
	name = "wall ladder"
	desc = "A ladder that mounts to walls."
	result_type = /obj/structure/wallladder
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
		/obj/item/grown/log/tree/stick = 3
	)
	supports_directions = TRUE
	craftdiff = 0
	check_adjacent_wall = TRUE

/datum/blueprint_recipe/carpentry/wooden_table
	name = "wooden table"
	desc = "A sturdy wooden table."
	result_type = /obj/structure/table/wood/crafted
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/wood/plank = 1
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/wooden_table_fancy
	name = "fancy wooden table"
	desc = "A sturdy, fancy looking wooden table."
	result_type = /obj/structure/table/wood/fancy
	required_materials = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_table_fancy_black
	name = "black fancy wooden table"
	desc = "A sturdy, fancy looking wooden table."
	result_type = /obj/structure/table/wood/fancy/black
	required_materials = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_table_fancy_blue
	name = "blue fancy wooden table"
	desc = "A sturdy, fancy looking wooden table."
	result_type = /obj/structure/table/wood/fancy/blue
	required_materials = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_table_fancy_cyan
	name = "cyan fancy wooden table"
	desc = "A sturdy, fancy looking wooden table."
	result_type = /obj/structure/table/wood/fancy/cyan
	required_materials = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_table_fancy_green
	name = "green fancy wooden table"
	desc = "A sturdy, fancy looking wooden table."
	result_type = /obj/structure/table/wood/fancy/green
	required_materials = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_table_fancy_orange
	name = "orange fancy wooden table"
	desc = "A sturdy, fancy looking wooden table."
	result_type = /obj/structure/table/wood/fancy/orange
	required_materials = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_table_fancy_purple
	name = "purple fancy wooden table"
	desc = "A sturdy, fancy looking wooden table."
	result_type = /obj/structure/table/wood/fancy/purple
	required_materials = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_table_fancy_red
	name = "red fancy wooden table"
	desc = "A sturdy, fancy looking wooden table."
	result_type = /obj/structure/table/wood/fancy/red
	required_materials = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_table_fancy_royalblack
	name = "royal black fancy wooden table"
	desc = "A sturdy, fancy looking wooden table."
	result_type = /obj/structure/table/wood/fancy/royalblack
	required_materials = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_table_fancy_royalblue
	name = "royal blue fancy wooden table"
	desc = "A sturdy, fancy looking wooden table."
	result_type = /obj/structure/table/wood/fancy/royalblue
	required_materials = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_table_fine
	name = "fine wooden table"
	desc = "A sturdy, fine looking wooden table."
	result_type = /obj/structure/table/wood/fine
	required_materials = list(
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/optable
	name = "operating table"
	desc = "A table made for surgery."
	result_type = /obj/structure/table/optable
	required_materials = list(
		/obj/item/ingot/iron = 1,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/wooden_table/smooth
	name = "wooden table"
	desc = "A sturdy wooden table."
	result_type = /obj/structure/table/wood/smooth
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/wood/plank = 1
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/wooden_table/round
	name = "round wooden table"
	desc = "A sturdy, round wooden table."
	result_type = /obj/structure/table/wood/round
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/wood/plank = 1
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/wooden_table/cloth
	name = "brown draped table"
	desc = "A sturdy wooden table draped in cloth."
	result_type = /obj/structure/table/wood/cloth/brown
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/wood/plank = 1,
		/obj/item/natural/cloth = 2
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/wooden_table/cloth/beige
	name = "beige draped table"
	desc = "A sturdy wooden table draped in cloth."
	result_type = /obj/structure/table/wood/cloth/beige
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/wood/plank = 1,
		/obj/item/natural/cloth = 2
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/wooden_table/cloth/red
	name = "red draped table"
	desc = "A sturdy wooden table draped in cloth."
	result_type = /obj/structure/table/wood/cloth/red
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/wood/plank = 1,
		/obj/item/natural/cloth = 2
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/wooden_table/cloth/blue
	name = "blue draped table"
	desc = "A sturdy wooden table draped in cloth."
	result_type = /obj/structure/table/wood/cloth/blue
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/wood/plank = 1,
		/obj/item/natural/cloth = 2
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/wooden_table/cloth/green
	name = "green draped table"
	desc = "A sturdy wooden table draped in cloth."
	result_type = /obj/structure/table/wood/cloth/green
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/wood/plank = 1,
		/obj/item/natural/cloth = 2
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/wooden_table/cloth/purple
	name = "purple draped table"
	desc = "A sturdy wooden table draped in cloth."
	result_type = /obj/structure/table/wood/cloth/purple
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/wood/plank = 1,
		/obj/item/natural/cloth = 2
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/pillory
	name = "pillory"
	desc = "A restraining device for punishment."
	result_type = /obj/structure/pillory
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/ingot/iron = 1,
	)
	supports_directions = TRUE
	craftdiff = 2


/datum/blueprint_recipe/structure/bars/wood
	name = "wooden barrier"
	desc = "A sturdy wooden barrier for keeping things out."
	result_type = /obj/structure/bars/wood
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/wood/plank = 1
	)
	supports_directions = FALSE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/easel
	name = "wooden easel"
	desc = "An easel for painting and art."
	result_type = /obj/structure/easel
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/grown/log/tree/stick = 2
	)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/carpentry/operating_table
	name = "operating table"
	desc = "A table designed for medical procedures."
	result_type = /obj/structure/table/optable
	required_materials = list(/obj/item/natural/wood/plank = 2)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/meathook
	name = "meathook"
	desc = "A hook for hanging and processing meat."
	result_type = /obj/structure/meathook
	required_materials = list(
		/obj/item/natural/wood/plank = 1,
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/stone = 1
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/spider_nest
	name = "spider nesting house"
	desc = "A constructed nest for spiders."
	result_type = /obj/structure/spider/nest/constructed
	required_materials = list(/obj/item/natural/wood/plank = 3)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/composter
	name = "composter"
	desc = "A constructed composter."
	result_type = /obj/structure/composter
	required_materials = list(/obj/item/grown/log/tree/small = 1)
	craftdiff = 0

/datum/blueprint_recipe/carpentry/plough
	name = "plough"
	desc = "A plough."
	result_type = /obj/structure/plough
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/ingot/iron = 1
	)
	build_time = 4 SECONDS

/datum/blueprint_recipe/carpentry/handcart
	name = "wooden handcart"
	desc = "A wooden handcart."
	result_type = /obj/structure/handcart
	required_materials = list(
		/obj/item/grown/log/tree/small = 3,
		/obj/item/rope = 1
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/apiary
	name = "Apiary"
	desc = "A home for bees."
	result_type = /obj/structure/apiary
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/wood/plank = 2,
		/obj/item/natural/fibers = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/dryclothes
	name = "Clothline"
	desc = "It can dry clothes well."
	result_type = /obj/structure/dryclothes
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/rope = 2
	)
	craftdiff = 0

/datum/blueprint_recipe/carpentry/keyrack
	name = "key rack"
	desc = "A cupboard for securing keys."
	result_type = /obj/structure/closet/keyrack
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
		/obj/item/ingot/iron = 1
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/globe
	name = "globe"
	desc = "It shows the world."
	result_type = /obj/structure/fluff/globe
	required_materials = list(
		/obj/item/natural/wood/plank = 1,
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/bookshelf
	name = "bookcase"
	desc = "It stores knowledge."
	result_type = /obj/structure/bookcase/fancy
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
	)
	craftdiff = 1
	skillcraft =/datum/attribute/skill/craft/carpentry

/datum/blueprint_recipe/carpentry/wallshelf
	name = "wall shelf"
	desc = "It stores your stuff."
	result_type = /obj/structure/rack/shelf
	required_materials = list(
		/obj/item/natural/wood/plank = 1,
	)
	craftdiff = 1
	skillcraft =/datum/attribute/skill/craft/carpentry
	supports_directions = TRUE
	category = "Wall Fixtures"

/datum/blueprint_recipe/carpentry/shelfbig
	name = "small shelf"
	desc = "It stores your stuff."
	result_type = /obj/structure/rack/shelf/big
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
	)
	craftdiff = 1
	skillcraft =/datum/attribute/skill/craft/carpentry

/datum/blueprint_recipe/carpentry/shelfbiggest
	name = "shelf"
	desc = "It stores your stuff."
	result_type = /obj/structure/rack/shelf/biggest
	required_materials = list(
		/obj/item/natural/wood/plank = 3,
	)
	craftdiff = 1
	skillcraft =/datum/attribute/skill/craft/carpentry

/datum/blueprint_recipe/carpentry/clock
	name = "clock"
	desc = "Tells the time."
	result_type = /obj/structure/fluff/clock
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
		/obj/item/gear/metal = 1,
	)
	craftdiff = 1
	skillcraft = /datum/attribute/skill/craft/carpentry

/datum/blueprint_recipe/carpentry/wallclock
	name = "wall clock"
	desc = "It tells the time."
	result_type = /obj/structure/fluff/wallclock
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
		/obj/item/gear/metal = 1,
	)
	craftdiff = 1
	skillcraft =/datum/attribute/skill/craft/carpentry
	supports_directions = TRUE
	category = "Wall Fixtures"

/datum/blueprint_recipe/carpentry/boards
	name = "boards"
	desc = "For keeping things out. Or in."
	result_type = /obj/structure/boards
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
	)
	craftdiff = 0

/datum/blueprint_recipe/carpentry/coucha
	name = "couch left"
	desc = "The left half of a very comfortable seat."
	result_type = /obj/structure/chair/bench/coucha
	required_materials = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/coucha_right
	name = "couch right"
	desc = "The right half of a very comfortable seat."
	result_type = /obj/structure/chair/bench/coucha/r
	required_materials = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/coucha_black
	name = "black couch left"
	desc = "The left half of a very comfortable seat."
	result_type = /obj/structure/chair/bench/couchablack
	required_materials = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/coucha_black_r
	name = "black couch right"
	desc = "The right half of a very comfortable seat."
	result_type = /obj/structure/chair/bench/couchablack/r
	required_materials = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/ultimacouch
	name = "green couch left"
	desc = "The left half of a very comfortable seat."
	result_type = /obj/structure/chair/bench/ultimacouch
	required_materials = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/ultimacouch_r
	name = "green couch right"
	desc = "The right half of a very comfortable seat."
	result_type = /obj/structure/chair/bench/ultimacouch/r
	required_materials = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/loungechair
	name = "lounge chair left"
	desc = "The left half of a very comfortable seat."
	result_type = /obj/structure/chair/bench/chaiselounge
	required_materials = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/loungechair_r
	name = "lounge chair right"
	desc = "The right half of a very comfortable seat."
	result_type = /obj/structure/chair/bench/chaiselounge/r
	required_materials = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/wood/plank = 2
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/bench
	name = "bench"
	desc = "A simplistic wooden bench."
	result_type = /obj/structure/chair/bench/church/smallbench
	required_materials = list(
		/obj/item/natural/wood/plank = 1
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/bench_stone
	name = "stone bench"
	desc = "A simplistic stone bench."
	result_type = /obj/structure/chair/bench/church/smallbench/stone
	required_materials = list(
		/obj/item/natural/stone = 2
	)
	craftdiff = 1

/datum/blueprint_recipe/carpentry/drawer
	name = "drawer"
	desc = "A small bedside table drawer."
	result_type = /obj/structure/closet/crate/drawer
	required_materials = list(
		/obj/item/natural/wood/plank = 1
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/bell_stand
	name = "bell stand"
	desc = "A ringable bell on a wooden stand that can be synced with the mind."
	result_type = /obj/structure/yeoman_bell/bell_stand
	required_materials = list(
		/obj/item/natural/wood/plank = 1,
		/obj/item/ingot/iron = 1
	)
	craftdiff = 2

/datum/blueprint_recipe/carpentry/banner_aelondan
	name = "aelonda standard"
	desc = "The purple standard of the good kingdom, Aelonda, without much decorum."
	result_type = /obj/structure/fluff/banner
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/silk = 2,
		/obj/item/natural/cloth = 1,
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/banner_cudao
	name = "cudao standard"
	desc = "The cloud-white standard of the eastern nation of Cudao, without much decorum."
	result_type = /obj/structure/fluff/banner/cudao
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/silk = 2,
		/obj/item/natural/cloth = 1,
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/banner_geramor
	name = "geramor standard"
	desc = "The standard of the nation of Geramor, without much decorum."
	result_type = /obj/structure/fluff/banner/geramor
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/silk = 2,
		/obj/item/natural/cloth = 1,
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/banner_noma
	name = "noma standard"
	desc = "The standard of the nation of Noma, without much decorum."
	result_type = /obj/structure/fluff/banner/noma
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/silk = 2,
		/obj/item/natural/cloth = 1,
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/banner_qadirid
	name = "qadirid standard"
	desc = "The standard of the nation of Qadirid, without much decorum."
	result_type = /obj/structure/fluff/banner/qadirid
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/silk = 2,
		/obj/item/natural/cloth = 1,
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/carpentry/banner_nortmidst
	name = "nortmidst standard"
	desc = "The standard of the nation of Nortmidst, without much decorum."
	result_type = /obj/structure/fluff/banner/nortmidst
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/silk = 2,
		/obj/item/natural/cloth = 1,
	)
	supports_directions = TRUE
	craftdiff = 2
