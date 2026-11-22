/datum/blueprint_recipe/engineering
	abstract_type = /datum/blueprint_recipe/engineering
	skillcraft = /datum/attribute/skill/craft/engineering
	category = "Engineering"
	construct_tool = /obj/item/weapon/hammer
	craftsound = 'sound/foley/Building-01.ogg'
	verbage = "assemble"
	verbage_tp = "assembles"

/datum/blueprint_recipe/engineering/artificer_table
	name = "artificer table"
	desc = "A specialized table for artificing work."
	result_type = /obj/machinery/artificer_table
	required_materials = list(
		/obj/item/natural/wood/plank = 2,
		/obj/item/natural/stone = 2
	)
	supports_directions = TRUE
	craftdiff = 1

/datum/blueprint_recipe/engineering/lever
	name = "lever"
	desc = "A mechanical lever for operating machinery."
	result_type = /obj/structure/lever
	required_materials = list(
		/obj/item/gear/metal = 1,
		/obj/item/grown/log/tree/stick = 1
	)
	supports_directions = TRUE
	craftdiff = 1

/datum/blueprint_recipe/engineering/trapdoor
	name = "floorhatch"
	desc = "A mechanical trapdoor for floor access."
	result_type = /obj/structure/floordoor
	required_materials = list(
		/obj/item/gear/metal = 1,
		/obj/item/grown/log/tree/small = 1
	)
	floor_object = TRUE
	craftdiff = 1

/datum/blueprint_recipe/engineering/pressure_plate
	name = "pressure plate"
	desc = "A mechanical plate that activates when stepped on."
	result_type = /obj/structure/pressure_plate
	required_materials = list(
		/obj/item/gear/metal = 1,
		/obj/item/natural/wood/plank = 2
	)
	floor_object = TRUE
	craftdiff = 1

/datum/blueprint_recipe/engineering/repeater
	name = "repeater"
	desc = "A device for extending mechanical signals."
	result_type = /obj/structure/repeater
	required_materials = list(
		/obj/item/gear/metal = 1,
		/obj/item/ingot/iron = 1,
		/obj/item/grown/log/tree/stick = 1
	)
	supports_directions = TRUE
	craftdiff = 1

/datum/blueprint_recipe/engineering/activator
	name = "activator"
	desc = "A complex mechanical activator device."
	result_type = /obj/structure/activator
	required_materials = list(
		/obj/item/gear/metal = 2,
		/obj/item/ingot/iron = 1,
		/obj/item/grown/log/tree/small = 1
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/engineering/passage
	name = "passage"
	desc = "A mechanical passage gate."
	result_type = /obj/structure/bars/passage
	required_materials = list(
		/obj/item/gear/metal = 1,
		/obj/item/ingot/iron = 1
	)
	supports_directions = TRUE
	craftdiff = 1

/datum/blueprint_recipe/engineering/distiller
	name = "copper distiller"
	desc = "A copper distillation apparatus."
	result_type = /obj/structure/fermentation_keg/distiller
	required_materials = list(
		/obj/item/ingot/copper = 2,
		/obj/item/gear/metal = 1
	)
	supports_directions = TRUE
	craftdiff = 2

/datum/blueprint_recipe/engineering/iron_bars
	name = "iron bars"
	desc = "Strong iron bars for security."
	result_type = /obj/structure/bars
	required_materials = list(/obj/item/ingot/iron = 1)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/engineering/bent_bars
	name = "iron bars (bent)"
	desc = "Bent iron bars with decorative curves."
	result_type = /obj/structure/bars/bent
	required_materials = list(/obj/item/ingot/iron = 1)
	supports_directions = TRUE
	craftdiff = 0

/datum/blueprint_recipe/engineering/auto_anvil
	name = "Auto Anvil"
	desc = "An automated anvil for mass production."
	result_type = /obj/structure/orphan_smasher
	required_materials = list(
		/obj/item/ingot/steel = 2,
		/obj/item/gear/metal = 2
	)
	supports_directions = TRUE
	craftdiff = 3

/datum/blueprint_recipe/engineering/cannon
	name = "Cannon"
	desc = "A powerful blackpowder weapon."
	result_type = /obj/structure/cannon
	required_materials = list(
		/obj/item/ingot/steel = 3,
		/obj/item/gear/metal = 4,
		/obj/item/grown/log/tree/small = 4,
	)
	supports_directions = TRUE
	craftdiff = 5

/datum/blueprint_recipe/engineering/streetlamp
	name = "streetlamp"
	desc = "A bright work of engineering."
	result_type = /obj/machinery/light/fueledstreet
	required_materials = list(
		/obj/item/ingot/iron = 2,
		/obj/item/gear/metal = 1,
	)
	craftdiff = 3

/datum/blueprint_recipe/engineering/streetlampmidlamp
	name = "midstreetlamp"
	desc = "A bright work of engineering."
	result_type = /obj/machinery/light/fueledstreet/midlamp
	required_materials = list(
		/obj/item/ingot/iron = 2,
		/obj/item/gear/metal = 1,
	)
	craftdiff = 3

/datum/blueprint_recipe/engineering/streetlampblue
	name = "blue streetlamp"
	desc = "A bright work of engineering."
	result_type = /obj/machinery/light/fueledstreet/blue
	required_materials = list(
		/obj/item/ingot/iron = 2,
		/obj/item/gear/metal = 1,
	)
	craftdiff = 3

/datum/blueprint_recipe/engineering/streetlampmidlampblue
	name = "blue midstreetlamp"
	desc = "A bright work of engineering."
	result_type = /obj/machinery/light/fueledstreet/blue/midlamp
	required_materials = list(
		/obj/item/ingot/iron = 2,
		/obj/item/gear/metal = 1,
	)
	craftdiff = 3

/datum/blueprint_recipe/engineering/streetlampbluewall
	name = "blue wall lamp"
	desc = "A bright work of engineering."
	result_type = /obj/machinery/light/fueledstreet/blue/wall
	required_materials = list(
		/obj/item/ingot/iron = 2,
		/obj/item/gear/metal = 1,
	)
	craftdiff = 3
	supports_directions = TRUE

/datum/blueprint_recipe/engineering/streetlamporange
	name = "orange streetlamp"
	desc = "A bright work of engineering."
	result_type = /obj/machinery/light/fueledstreet/orange
	required_materials = list(
		/obj/item/ingot/iron = 2,
		/obj/item/gear/metal = 1,
	)
	craftdiff = 3

/datum/blueprint_recipe/engineering/streetlamporangewall
	name = "streetlamp"
	desc = "A bright work of engineering."
	result_type = /obj/machinery/light/fueledstreet/orange/wall
	required_materials = list(
		/obj/item/ingot/iron = 2,
		/obj/item/gear/metal = 1,
	)
	craftdiff = 3
	supports_directions = TRUE

/datum/blueprint_recipe/engineering/sink
	name = "sink"
	desc = "Tastes like lead."
	result_type = /obj/structure/well/fountain/sink
	required_materials = list(
		/obj/item/ingot/steel = 2,
		/obj/item/gear/metal = 4,
		/obj/item/ingot/bronze = 2
	)
	craftdiff = 4

/datum/blueprint_recipe/engineering/winch
	name = "winch"
	desc = "A pulley system with iron chain."
	result_type = /obj/structure/winch
	required_materials = list(
		/obj/item/ingot/iron = 2,
		/obj/item/gear/metal = 1,
	)
	craftdiff = 3

/datum/blueprint_recipe/engineering/gate
	name = "large gate"
	desc = "A large winch-driven gate system."
	result_type = /obj/structure/gate/bars/preopen
	required_materials = list(
		/obj/item/ingot/iron = 10,
		/obj/item/gear/metal = 5,
	)
	craftdiff = 4

/datum/blueprint_recipe/engineering/persistent_storage
	name = "instanced vessel"
	desc = "A vessel which allows you to save particularly intricate valuables in an instancer crystal."
	result_type = /obj/structure/persistent_storage
	required_materials = list(
		/obj/item/alch/airdust = 4,
		/obj/item/alch/magicdust = 2,
		/obj/item/ingot/iron = 2,
		/obj/item/gear/metal = 1,
	)
	craftdiff = 3
