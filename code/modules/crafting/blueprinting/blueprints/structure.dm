/datum/blueprint_recipe/structure
	abstract_type = /datum/blueprint_recipe/structure
	category = "Structures"
	build_time = 4 SECONDS

/datum/blueprint_recipe/structure/tentdoor
	name = "Tent Door"
	desc = "A tent door structure."
	result_type = /obj/structure/roguetent
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor
	name = "Blue Tent Door"
	desc = "A tent door structure."
	result_type = /obj/structure/tentdoor
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/cyan
	name = "Cyan Tent Door"
	desc = "A tent door structure."
	result_type = /obj/structure/tentdoor/cyan
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/brown
	name = "Brown Tent Door"
	desc = "A tent door structure."
	result_type = /obj/structure/tentdoor/brown
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/green
	name = "Green Tent Door"
	desc = "A tent door structure."
	result_type = /obj/structure/tentdoor/green
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/purple
	name = "Purple Tent Door"
	desc = "A tent door structure."
	result_type = /obj/structure/tentdoor/purple
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/red
	name = "Red Tent Door"
	desc = "A tent door structure."
	result_type = /obj/structure/tentdoor/red
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/reddeco
	name = "Decorated Red Tent Door"
	desc = "A tent door embossed with gold."
	result_type = /obj/structure/tentdoor/reddeco
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/purpledeco
	name = "Decorated Purple Tent Door"
	desc = "A tent door embossed with gold."
	result_type = /obj/structure/tentdoor/purpledeco
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/greendeco
	name = "Decorated Green Tent Door"
	desc = "A tent door embossed with gold."
	result_type = /obj/structure/tentdoor/greendeco
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/browndeco
	name = "Decorated Brown Tent Door"
	desc = "A tent door embossed with gold."
	result_type = /obj/structure/tentdoor/browndeco
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/cyandeco
	name = "Decorated Cyan Tent Door"
	desc = "A tent door embossed with gold."
	result_type = /obj/structure/tentdoor/cyandeco
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/bluedeco
	name = "Decorated Blue Tent Door"
	desc = "A tent door embossed with gold."
	result_type = /obj/structure/tentdoor/bluedeco
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/tentdoor/noc
	name = "Decorated Navy Tent Door"
	desc = "A tent door embossed with silver."
	result_type = /obj/structure/tentdoor/noc
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"
	build_time = 3 SECONDS

/datum/blueprint_recipe/structure/anvil
	name = "Anvil"
	desc = "A heavy iron anvil for metalworking."
	result_type = /obj/machinery/anvil
	required_materials = list(
		/obj/item/ingot/iron = 1
	)
	construct_tool = /obj/item/weapon/hammer
	build_time = 5 SECONDS
	category = "Structures"


/datum/blueprint_recipe/structure/campfire
	name = "Campfire"
	desc = "A simple campfire for light and warmth."
	result_type = /obj/machinery/light/fueled/campfire
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2
	)
	construct_tool = /obj/item/grown/log/tree/stick
	category = "Structures"


/datum/blueprint_recipe/structure/densefire
	name = "Greater Campfire"
	desc = "A larger, more efficient campfire."
	result_type = /obj/machinery/light/fueled/campfire/densefire
	required_materials = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/stone = 2
	)
	construct_tool = /obj/item/grown/log/tree/stick
	category = "Structures"


/datum/blueprint_recipe/structure/cookpit
	name = "Hearth"
	desc = "A stone hearth for cooking and warmth."
	result_type = /obj/machinery/light/fueled/hearth
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/stone = 3
	)
	construct_tool = /obj/item/grown/log/tree/stick
	category = "Structures"


/datum/blueprint_recipe/structure/brazier
	name = "Brazier"
	desc = "A wooden brazier with coal for heating."
	result_type = /obj/machinery/light/fueled/firebowl/stump
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/ore/coal = 1
	)
	construct_tool = /obj/item/grown/log/tree/small
	category = "Structures"


/datum/blueprint_recipe/structure/standing
	name = "Standing Fire"
	desc = "A standing stone fire bowl."
	result_type = /obj/machinery/light/fueled/firebowl/standing
	required_materials = list(
		/obj/item/natural/stone = 1,
		/obj/item/ore/coal = 1
	)
	construct_tool = /obj/item/weapon/hammer
	category = "Structures"


/datum/blueprint_recipe/structure/standingblue
	name = "Standing Fire (Blue)"
	desc = "A standing stone fire bowl with blue flames."
	result_type = /obj/machinery/light/fueled/firebowl/standing/blue
	required_materials = list(
		/obj/item/natural/stone = 1,
		/obj/item/ore/coal = 1,
		/obj/item/fertilizer/ash = 1
	)
	construct_tool = /obj/item/weapon/hammer
	category = "Structures"


/datum/blueprint_recipe/structure/rack
	name = "Rack"
	desc = "A simple wooden storage rack."
	result_type = /obj/structure/rack
	required_materials = list(
		/obj/item/grown/log/tree/stick = 3
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"


/datum/blueprint_recipe/structure/dryingrack
	name = "Drying Rack"
	desc = "A rack for drying and tanning materials."
	result_type = /obj/machinery/tanningrack
	required_materials = list(
		/obj/item/grown/log/tree/stick = 3
	)
	construct_tool = null
	category = "Structures"

/datum/blueprint_recipe/structure/curtain
	name = "Curtain"
	desc = "A long-draped curtain."
	result_type = /obj/structure/curtain/bounty
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing


/datum/blueprint_recipe/structure/curtain/bluecurtain
	name = "Fancy Blue Curtain"
	desc = "A long-draped curtain."
	result_type = /obj/structure/curtain/bluecurtain
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/cyancurtain
	name = "Fancy Cyan Curtain"
	desc = "A long-draped curtain."
	result_type = /obj/structure/curtain/cyancurtain
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/browncurtain
	name = "Fancy Brown Curtain"
	desc = "A long-draped curtain."
	result_type = /obj/structure/curtain/browncurtain
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/greencurtain
	name = "Fancy Green Curtain"
	desc = "A long-draped curtain."
	result_type = /obj/structure/curtain/greencurtain
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/purplecurtain
	name = "Fancy Purple Curtain"
	desc = "A long-draped curtain."
	result_type = /obj/structure/curtain/purplecurtain
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/redcurtain
	name = "Fancy Red Curtain"
	desc = "A long-draped curtain."
	result_type = /obj/structure/curtain/redcurtain
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/noccurtain
	name = "Fancy Navy Curtain"
	desc = "Decorative navy curtains, popular in the East."
	result_type = /obj/structure/curtain/noccurtain
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/browncurtainold
	name = "Old Brown Curtain"
	desc = "Old brown curtains, moth-eaten and dusty."
	result_type = /obj/structure/curtain/browncurtainold
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/redcurtainold
	name = "Old Red Curtain"
	desc = "Old red curtains, moth-eaten and dusty."
	result_type = /obj/structure/curtain/redcurtainold
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/bluecurtainold
	name = "Old Blue Curtain"
	desc = "Old blue curtains, moth-eaten and dusty."
	result_type = /obj/structure/curtain/bluecurtainold
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/greencurtainold
	name = "Old Green Curtain"
	desc = "Old green curtains, moth-eaten and dusty."
	result_type = /obj/structure/curtain/greencurtainold
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/beigecurtainold
	name = "Old Beige Curtain"
	desc = "Old beige curtains, moth-eaten and dusty."
	result_type = /obj/structure/curtain/beigecurtainold
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/purplecurtainold
	name = "Old Purple Curtain"
	desc = "Old purple curtains, moth-eaten and dusty."
	result_type = /obj/structure/curtain/purplecurtainold
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/curtain/suncurtain
	name = "Sun Curtain"
	desc = "Curtains woven with warm hues to keep the cold out."
	result_type = /obj/structure/curtain/suncurtain
	required_materials = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/bed
	name = "Bed"
	desc = "A simple wooden bed with fiber bedding."
	result_type = /obj/structure/bed/shit
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"

/datum/blueprint_recipe/structure/wickertrunk
	name = "Wicker Trunk"
	desc = "Fibers interwoven to make a somewhat sturdy trunk."
	result_type = /obj/structure/closet/crate/chest/wickertrunk
	required_materials = list(
		/obj/item/natural/fibers = 2,
		/obj/item/grown/log/tree/stick = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"

/datum/blueprint_recipe/structure/wickertrunk/red
	name = "Wicker Trunk With Red Throw"
	desc = "A somewhat sturdy wicker trunk covered in a red linen throw rug, quaint."
	result_type = /obj/structure/closet/crate/chest/wickertrunk/red
	required_materials = list(
		/obj/item/natural/fibers = 2,
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"

/datum/blueprint_recipe/structure/wickertrunk/blue
	name = "Wicker Trunk With Blue Throw"
	desc = "A somewhat sturdy wicker trunk covered in a blue linen throw rug, quaint."
	result_type = /obj/structure/closet/crate/chest/wickertrunk/blue
	required_materials = list(
		/obj/item/natural/fibers = 2,
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/cloth = 1
	)
	construct_tool = /obj/item/weapon/knife
	category = "Structures"

/datum/blueprint_recipe/structure/shippingcrate
	name = "Shipping Crate"
	desc = "A sturdy crate made up of wood planks and held together with bronze nails."
	result_type = /obj/structure/closet/crate/chest/shippingcrate
	required_materials = list(
		/obj/item/grown/log/tree/stick = 3
	)
	construct_tool = /obj/item/weapon/hammer
	category = "Structures"

/datum/blueprint_recipe/structure/moonrug
	name = "Moon Rug"
	desc = "A decorative rug depicting the phases of the moon."
	result_type = /obj/structure/fluff/moonrug
	required_materials = list(
		/obj/item/natural/cloth = 3
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/sunrug
	name = "Sug Rug"
	desc = "A decorative rug depicting the sun."
	result_type = /obj/structure/fluff/sunrug
	required_materials = list(
		/obj/item/natural/cloth = 3
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/fibermat/square
	name = "Square Fiber Mat"
	desc = "A rustic mat woven from fiber."
	result_type = /obj/structure/fluff/fibermat/square
	required_materials = list(
		/obj/item/natural/fibers = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/fibermat/round
	name = "Round Fiber Mat"
	desc = "A rustic mat woven from fiber."
	result_type = /obj/structure/fluff/fibermat/round
	required_materials = list(
		/obj/item/natural/fibers = 2
	)
	construct_tool = /obj/item/needle
	category = "Structures"
	skillcraft = /datum/attribute/skill/misc/sewing

/datum/blueprint_recipe/structure/clutter/books
	name = "Clutter (Books)"
	desc = "A few stacks of books with a pot of ink & quill waiting for inspiration."
	result_type = /obj/structure/fluff/clutter/books
	required_materials = list(
		/obj/item/natural/fibers = 2,
		/obj/item/natural/hide/cured = 1
	)
	category = "Structures"

/datum/blueprint_recipe/structure/clutter/teapot
	name = "Clutter (Teapot)"
	desc = "A teapot & accompanying cups on a mat."
	result_type = /obj/structure/fluff/clutter/teapot
	required_materials = list(
		/obj/item/natural/stone = 2
	)
	category = "Structures"

/datum/blueprint_recipe/structure/clutter/sewing
	name = "Clutter (Sewing)"
	desc = "A handful of fiber and cloth."
	result_type = /obj/structure/fluff/clutter/sewing
	required_materials = list(
		/obj/item/natural/fibers = 1,
		/obj/item/natural/cloth = 2,
	)
	category = "Structures"

/datum/blueprint_recipe/structure/clutter/tablecloth/moon
	name = "Clutter (Tablecloth, Moon)"
	desc = "A decorative table cloth depicting the moon."
	result_type = /obj/structure/fluff/clutter/tablecloth/moon
	required_materials = list(
		/obj/item/natural/cloth = 2
	)
	category = "Structures"

/datum/blueprint_recipe/structure/clutter/tablecloth/sun
	name = "Clutter (Tablecloth, Sun)"
	desc = "A decorative table cloth depicting the sun."
	result_type = /obj/structure/fluff/clutter/tablecloth/sun
	required_materials = list(
		/obj/item/natural/cloth = 2
	)
	category = "Structures"

/datum/blueprint_recipe/structure/clutter/shrub/tundra
	name = "potted shrub blue"
	desc = "A stone pot with a cold tundra shrub there-in."
	result_type = /obj/structure/fluff/clutter/shrub/tundra
	required_materials = list(
		/obj/item/natural/stone = 2,
		/obj/item/natural/clod/dirt
	)
	category = "Structures"

/datum/blueprint_recipe/structure/clutter/shrub/red
	name = "potted shrub red"
	desc = "A stone pot with a red autumnal shrub there-in."
	result_type = /obj/structure/fluff/clutter/shrub/red
	required_materials = list(
		/obj/item/natural/stone = 2,
		/obj/item/natural/clod/dirt
	)
	category = "Structures"

/datum/blueprint_recipe/structure/millstone
	name = "Millstone"
	desc = "A stone millstone for grinding grain."
	result_type = /obj/structure/fluff/millstone
	required_materials = list(
		/obj/item/natural/stone = 3
	)
	construct_tool = /obj/item/weapon/hammer
	category = "Structures"

	skillcraft = /datum/attribute/skill/craft/masonry


/datum/blueprint_recipe/structure/noose
	name = "Noose"
	desc = "Hangs from the ceiling."
	result_type = /obj/structure/noose
	required_materials = list(
		/obj/item/rope = 1
	)
	construct_tool = /obj/item/rope
	verbage = "tie"
	verbage_tp = "ties"
	category = "Structures"
	requires_ceiling = TRUE


/datum/blueprint_recipe/structure/pottery_lathe
	name = "Potter Lathe"
	desc = "A lathe for creating pottery."
	result_type = /obj/structure/pottery_lathe
	required_materials = list(
		/obj/item/natural/stone = 2,
		/obj/item/grown/log/tree/small = 1
	)
	construct_tool = /obj/item/weapon/hammer
	category = "Structures"

	skillcraft = /datum/attribute/skill/craft/carpentry

/datum/blueprint_recipe/structure/torchholder
	name = "Sconce"
	desc = "A stone wall sconce for holding torches."
	result_type = /obj/machinery/light/fueled/torchholder
	required_materials = list(
		/obj/item/natural/stone = 2
	)
	construct_tool = /obj/item/weapon/hammer
	category = "Wall Fixtures"
	floor_object = FALSE
	skillcraft = /datum/attribute/skill/craft/masonry
	check_adjacent_wall = TRUE
	supports_directions = TRUE
	inverse_check = TRUE

/datum/blueprint_recipe/structure/wallcandle
	name = "Wall Candles"
	desc = "Stone wall-mounted candleholders."
	result_type = /obj/machinery/light/fueled/wallfire/candle
	required_materials = list(
		/obj/item/natural/stone = 1,
		/obj/item/candle/yellow = 1
	)
	construct_tool = /obj/item/weapon/hammer
	category = "Wall Fixtures"
	floor_object = FALSE
	skillcraft = /datum/attribute/skill/craft/masonry
	check_adjacent_wall = TRUE
	supports_directions = TRUE
	place_on_wall = TRUE

/datum/blueprint_recipe/structure/wallcandleblue
	name = "Wall Candles (Blue)"
	desc = "Stone wall-mounted candleholders with blue flames."
	result_type = /obj/machinery/light/fueled/wallfire/candle/blue
	required_materials = list(
		/obj/item/natural/stone = 1,
		/obj/item/candle/yellow = 1,
		/obj/item/fertilizer/ash = 1
	)
	construct_tool = /obj/item/weapon/hammer
	category = "Wall Fixtures"
	floor_object = FALSE
	skillcraft = /datum/attribute/skill/craft/masonry
	check_adjacent_wall = TRUE
	supports_directions = TRUE
	place_on_wall = TRUE

/datum/blueprint_recipe/structure/hanging_bell_wall
	name = "Hanging Wall Bell"
	desc = "A ringable bell that hangs on a chain and can sync to the mind."
	result_type = /obj/structure/yeoman_bell/hanging_bell
	required_materials = list(
		/obj/item/ingot/iron = 2,
	)
	construct_tool = /obj/item/weapon/hammer
	category = "Wall Fixtures"
	floor_object = FALSE
	skillcraft = /datum/attribute/skill/craft/crafting
	craftdiff = 2
	check_adjacent_wall = TRUE
	supports_directions = TRUE
	place_on_wall = TRUE

/datum/blueprint_recipe/structure/hanging_bell_ceiling
	name = "Hanging Ceiling Bell"
	desc = "A ringable bell that hangs on a chain and can sync to the mind."
	result_type = /obj/structure/yeoman_bell/hanging_bell
	required_materials = list(
		/obj/item/ingot/iron = 2,
	)
	construct_tool = /obj/item/weapon/hammer
	category = "Wall Fixtures"
	floor_object = FALSE
	skillcraft = /datum/attribute/skill/craft/crafting
	craftdiff = 2

/datum/blueprint_recipe/structure/bearpelt
	name = "bear pelt rug"
	desc = "A pelt of a direbear, now used as a floor decoration."
	required_materials = list(
		/obj/item/natural/fur/direbear = 2,
	)
	result_type = /obj/structure/bearpelt
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/craft/tanning
	craftdiff = 2

/datum/blueprint_recipe/structure/carpet
	name = "carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 1,
	)
	result_type = /obj/structure/carpet
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2

/datum/blueprint_recipe/structure/carpet_blue
	name = "blue carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 1,
	)
	result_type = /obj/structure/carpet/blue
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2

/datum/blueprint_recipe/structure/carpet_cyan
	name = "cyan carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 1,
	)
	result_type = /obj/structure/carpet/cyan
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2

/datum/blueprint_recipe/structure/carpet_green
	name = "green carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 1,
	)
	result_type = /obj/structure/carpet/green
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2

/datum/blueprint_recipe/structure/carpet_purple
	name = "purple carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 1,
	)
	result_type = /obj/structure/carpet/purple
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2

/datum/blueprint_recipe/structure/carpet_red
	name = "red carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 1,
	)
	result_type = /obj/structure/carpet/red
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2

/datum/blueprint_recipe/structure/carpet_navy
	name = "navy carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 1,
	)
	result_type = /obj/structure/carpet/navy
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2

/datum/blueprint_recipe/structure/giantfur
	name = "giant fur"
	desc = "The pelt of some massive creature made into a floor decoration."
	required_materials = list(
		/obj/item/natural/hide = 5,
	)
	result_type = /obj/structure/giantfur
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/craft/tanning
	craftdiff = 2

/datum/blueprint_recipe/structure/giantfur_small
	name = "medium fur"
	desc = "The pelt of some moderately sized creature made into a floor decoration."
	required_materials = list(
		/obj/item/natural/hide = 3,
	)
	result_type = /obj/structure/giantfur/small
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/craft/tanning
	craftdiff = 2

/datum/blueprint_recipe/structure/giantfur_smaller
	name = "small fur"
	desc = "The pelt of some creature made into a floor decoration."
	required_materials = list(
		/obj/item/natural/hide = 1,
	)
	result_type = /obj/structure/giantfur/smaller
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/craft/tanning
	craftdiff = 2

/datum/blueprint_recipe/structure/deertrophy
	name = "saiga trophy"
	desc = "The trophy head of a Saiga."
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/head/saiga
	)
	result_type = /obj/structure/fluff/walldeco/sign/trophy
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 2
	place_on_wall = TRUE

/datum/blueprint_recipe/structure/armorsmithsign
	name = "armorsmith sign"
	desc = " sign for a shop."
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
	)
	result_type = /obj/structure/fluff/walldeco/sign/armorsmithsign
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/armorsmithsignleft
	name = "armorsmith sign left"
	desc = "A sign for a shop."
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
	)
	result_type = /obj/structure/fluff/walldeco/sign/armorsmithsign/left
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/saigasign
	name = "saiga sign"
	desc = "A sign for a shop."
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
	)
	result_type = /obj/structure/fluff/walldeco/sign/saiga
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/saigasignleft
	name = "saiga sign left"
	desc = "A sign for a shop."
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
	)
	result_type = /obj/structure/fluff/walldeco/sign/saiga/left
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/tailorsign
	name = "tailor sign"
	desc = "A sign for a shop."
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
	)
	result_type = /obj/structure/fluff/walldeco/sign/tailorsign
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/tailorsignleft
	name = "tailor sign left"
	desc = "A sign for a shop."
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
	)
	result_type = /obj/structure/fluff/walldeco/sign/tailorsign/left
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/archdevil_cross
	name = "Archdevil Cross"
	desc = "A blasphemous sign. You won't make any friends with this."
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
	)
	result_type = /obj/structure/fluff/psycross/archdevil_cross
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/angros
	name = "Angros Cross"
	desc = "A cross of a near forgotten god."
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
	)
	result_type = /obj/structure/fluff/psycross/angros
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/allaspectcross
	name = "Pantheon Cross"
	desc = "A holy sign for the all-around elementalist."
	required_materials = list(
		/obj/item/ingot/iron = 1,
		/obj/item/alch/airdust = 1,
		/obj/item/alch/firedust = 1,
		/obj/item/alch/earthdust = 1,
		/obj/item/alch/waterdust = 1
	)
	result_type = /obj/structure/fluff/psycross/copper
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/ganicross
	name = "Gani Cross"
	desc = "A holy sign for the worshippers of the earth itself."
	required_materials = list(
		/obj/item/ingot/iron = 1,
		/obj/item/alch/earthdust = 2
	)
	result_type = /obj/structure/fluff/psycross/gani
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/pommettecross
	name = "Pommette Cross"
	desc = "A holy sign for the naive and innocent."
	required_materials = list(
		/obj/item/ingot/iron = 1,
		/obj/item/alch/earthdust = 1
	)
	result_type = /obj/structure/fluff/psycross/pomette
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/mjallidhorncross
	name = "Mjallidhorn Cross"
	desc = "A holy sign for the warriors and stalwart defenders of the world."
	required_materials = list(
		/obj/item/ingot/iron = 1,
		/obj/item/alch/waterdust = 2
	)
	result_type = /obj/structure/fluff/psycross/mjallidhorn
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/mordsolcross
	name = "Mordsol Cross"
	desc = "A holy sign for those who refuse to die."
	required_materials = list(
		/obj/item/ingot/iron = 1,
		/obj/item/alch/waterdust = 1,
		/obj/item/alch/firedust = 1
	)
	result_type = /obj/structure/fluff/psycross/mordsol
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/valdalacross
	name = "Valdala Cross"
	desc = "A holy sign for those who will not forget the fallen."
	required_materials = list(
		/obj/item/alch/waterdust = 1
	)
	result_type = /obj/structure/fluff/psycross/valdala
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/akancross
	name = "Akan Cross"
	desc = "A holy sign for the worshippers of the spark of curiosity."
	required_materials = list(
		/obj/item/ingot/iron = 1,
		/obj/item/alch/airdust = 2
	)
	result_type = /obj/structure/fluff/psycross/akan
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/erdlcross
	name = "Erdl Cross"
	desc = "A holy sign for the physicians and infirm."
	required_materials = list(
		/obj/item/ingot/iron = 1,
		/obj/item/alch/earthdust = 1
	)
	result_type = /obj/structure/fluff/psycross/erdl
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 1

/datum/blueprint_recipe/structure/angros_metal_cross
	name = "metal psycross"
	desc = "A holy sign dedicated to one nearly forgotten."
	required_materials = list(
		/obj/item/ingot/iron = 1,
	)
	result_type = /obj/structure/fluff/psycross/angros/metal
	construct_tool = /obj/item/weapon/hammer
	skillcraft = /datum/attribute/skill/craft/crafting
	craftdiff = 3

/datum/blueprint_recipe/structure/visires_cross
	name = "visires cross"
	desc = "A holy sign for those who won't give up their spirit."
	required_materials = list(
		/obj/item/ingot/iron = 2,
		/obj/item/alch/firedust = 1
	)
	result_type = /obj/structure/fluff/psycross/visires
	construct_tool = /obj/item/weapon/hammer
	skillcraft = /datum/attribute/skill/craft/crafting
	craftdiff = 3

/datum/blueprint_recipe/structure/decalcarpet
	name = "big carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 2,
	)
	result_type = /obj/effect/decal/carpet
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2
	supports_directions = TRUE

/datum/blueprint_recipe/structure/decalcarpetblack
	name = "big black carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 2,
	)
	result_type = /obj/effect/decal/carpet/kover_black
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2
	supports_directions = TRUE

/datum/blueprint_recipe/structure/decalcarpetdarkred
	name = "big dark red carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 2,
	)
	result_type = /obj/effect/decal/carpet/kover_darkred
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2
	supports_directions = TRUE

/datum/blueprint_recipe/structure/decalcarpetpurple
	name = "big purple carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 2,
	)
	result_type = /obj/effect/decal/carpet/kover_purple
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2
	supports_directions = TRUE
/datum/blueprint_recipe/structure/decalcarpetsquare
	name = "big square carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 2,
	)
	result_type = /obj/effect/decal/carpet/square
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2
	supports_directions = TRUE

/datum/blueprint_recipe/structure/decalcarpetsquareblack
	name = "bigblack square carpet"
	desc = "A soft carpet for the floor."
	required_materials = list(
		/obj/item/natural/cloth = 2,
	)
	result_type = /obj/effect/decal/carpet/square/black
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2
	supports_directions = TRUE

/datum/blueprint_recipe/structure/mirror
	name = "mirror"
	desc = "A large mirror."
	required_materials = list(
		/obj/item/natural/glass = 1,
		/obj/item/natural/wood/plank = 2
	)
	result_type = /obj/structure/mirror
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 2

/datum/blueprint_recipe/structure/mirrorornate
	name = "ornate mirror"
	desc = "A large mirror."
	required_materials = list(
		/obj/item/natural/glass = 1,
		/obj/item/natural/wood/plank = 2,
		/obj/item/ingot/gold = 1
	)
	result_type = /obj/structure/mirror/fancy
	construct_tool = /obj/item/weapon/hammer
	craftdiff = 2

/datum/blueprint_recipe/structure/large_pillow
	name = "large floor pillow"
	desc = "A large floor pillow stuffed with feathers."
	result_type = /obj/structure/bed/wool/pillow
	required_materials = list(
		/obj/item/natural/feather = 2,
		/obj/item/natural/cloth = 2
	)
	construct_tool = /obj/item/needle
	skillcraft = /datum/attribute/skill/misc/sewing
	craftdiff = 2

/datum/blueprint_recipe/structure/large_pillow/red
	name = "large floor pillow (red)"
	result_type = /obj/structure/bed/wool/pillow/red

/datum/blueprint_recipe/structure/large_pillow/red/regal
	name = "large floor pillow (regal red)"
	required_materials = list(
		/obj/item/natural/feather = 3,
		/obj/item/natural/cloth = 2,
		/obj/item/ore/dust/gold = 2
	)
	craftdiff = 3
	result_type = /obj/structure/bed/wool/pillow/red/regal

/datum/blueprint_recipe/structure/large_pillow/blue
	name = "large floor pillow (blue)"
	result_type = /obj/structure/bed/wool/pillow/blue

/datum/blueprint_recipe/structure/large_pillow/blue/regal
	name = "large floor pillow (regal blue)"
	required_materials = list(
		/obj/item/natural/feather = 3,
		/obj/item/natural/cloth = 2,
		/obj/item/ore/dust/gold = 2
	)
	craftdiff = 3
	result_type = /obj/structure/bed/wool/pillow/blue/regal

/datum/blueprint_recipe/structure/large_pillow/orange
	name = "large floor pillow (orange)"
	result_type = /obj/structure/bed/wool/pillow/orange

/datum/blueprint_recipe/structure/large_pillow/orange/regal
	name = "large floor pillow (regal orange)"
	required_materials = list(
		/obj/item/natural/feather = 3,
		/obj/item/natural/cloth = 2,
		/obj/item/ore/dust/gold = 2
	)
	craftdiff = 3
	result_type = /obj/structure/bed/wool/pillow/orange/regal

/datum/blueprint_recipe/structure/large_pillow/cyan
	name = "large floor pillow (cyan)"
	result_type = /obj/structure/bed/wool/pillow/cyan

/datum/blueprint_recipe/structure/large_pillow/cyan/regal
	name = "large floor pillow (regal cyan)"
	required_materials = list(
		/obj/item/natural/feather = 3,
		/obj/item/natural/cloth = 2,
		/obj/item/ore/dust/gold = 2
	)
	craftdiff = 3
	result_type = /obj/structure/bed/wool/pillow/cyan/regal

/datum/blueprint_recipe/structure/large_pillow/purple
	name = "large floor pillow (purple)"
	result_type = /obj/structure/bed/wool/pillow/purple

/datum/blueprint_recipe/structure/large_pillow/purple/regal
	name = "large floor pillow (regal purple)"
	required_materials = list(
		/obj/item/natural/feather = 3,
		/obj/item/natural/cloth = 2,
		/obj/item/ore/dust/gold = 2
	)
	craftdiff = 3
	result_type = /obj/structure/bed/wool/pillow/purple/regal

/datum/blueprint_recipe/structure/large_pillow/navy
	name = "large floor pillow (navy)"
	result_type = /obj/structure/bed/wool/pillow/navy

/datum/blueprint_recipe/structure/large_pillow/navy/regal
	name = "large floor pillow (regal navy)"
	required_materials = list(
		/obj/item/natural/feather = 3,
		/obj/item/natural/cloth = 2,
		/obj/item/ore/dust/gold = 2
	)
	craftdiff = 3
	result_type = /obj/structure/bed/wool/pillow/navy/regal
