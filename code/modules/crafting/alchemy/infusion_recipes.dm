/datum/infusion_recipe
	abstract_type = /datum/infusion_recipe
	var/category = "Infusions"
	var/name = "infusion recipe"
	var/obj/item/target_type
	var/list/required_essences = list() // essence_type = amount
	var/infusion_time = 10 SECONDS
	var/obj/item/result_type

/datum/infusion_recipe/glass
	name = "Glass Transmutation"
	target_type  = /obj/item/natural/stone
	result_type = /obj/item/natural/glass
	required_essences = list(/datum/thaumaturgical_essence/crystal = 5)

/datum/infusion_recipe/heat_iron
	name = "Heat Iron"
	target_type  = /obj/item/ore/iron
	result_type = /obj/item/ingot/iron
	required_essences = list(/datum/thaumaturgical_essence/fire = 10)

/datum/infusion_recipe/thaumic_iron
	name = "Thaumic Iron"
	target_type  = /obj/item/ingot/iron
	result_type = /obj/item/ingot/thaumic
	required_essences = list(/datum/thaumaturgical_essence/fire = 10)

/datum/infusion_recipe/mana_crystal
	name = "Mana Crystal"
	target_type  = /obj/item/gem
	result_type = /obj/item/mana_battery/mana_crystal/standard
	required_essences = list(/datum/thaumaturgical_essence/magic = 10)

/datum/infusion_recipe/seed_random
	name = "Seed Transmutation"
	target_type  = /obj/item/neuFarm/seed
	result_type = /obj/item/neuFarm/seed/mixed_seed
	required_essences = list(/datum/thaumaturgical_essence/life = 5)

//quicksilver is mercury
//so we're literally transmuting silver into quicksilver
//hence the cost of magic, earth, and motion essence
//magic because... magic
//earth because we are turning one metal into another, heavier metal
//motion because QUICKsilver, get it?
/datum/infusion_recipe/cinnabar
	name = "Cinnabar Transmutation"
	target_type  = /obj/item/alch/silverdust
	result_type = /obj/item/ore/cinnabar
	required_essences = list(/datum/thaumaturgical_essence/magic = 20, /datum/thaumaturgical_essence/earth = 10, /datum/thaumaturgical_essence/motion = 10)

/datum/infusion_recipe/jar_two
	name = "Containment Enchantment"
	target_type  = /obj/item/essence_node_jar
	result_type = /obj/item/essence_node_jar/advanced
	required_essences = list(/datum/thaumaturgical_essence/magic = 20, /datum/thaumaturgical_essence/earth = 10)

/datum/infusion_recipe/combat_flask
	name = "Combat Flask Synthesis"
	target_type  = /obj/item/natural/glass
	result_type = /obj/item/essence_vial/combat
	required_essences = list(/datum/thaumaturgical_essence/magic = 20, /datum/thaumaturgical_essence/earth = 10)

// ---- SUMMON DROP TRANSFORMATION RECIPES ---
// there are three drops per tier, we can rotate within the tier for ones we're missing

// TIER 1
/datum/infusion_recipe/t1_fire
	name = "Infernal Shift"
	target_type = /obj/item/natural/fairydust
	result_type = /obj/item/natural/infernalash
	required_essences = list(/datum/thaumaturgical_essence/fire = 10)
/datum/infusion_recipe/t1_fae
	name = "Fae Shift"
	target_type = /obj/item/natural/elementalmote
	result_type = /obj/item/natural/fairydust
	required_essences = list(/datum/thaumaturgical_essence/air = 10)
/datum/infusion_recipe/t1_stone
	name = "Elemental Shift"
	target_type = /obj/item/natural/infernalash
	result_type = /obj/item/natural/elementalmote
	required_essences = list(/datum/thaumaturgical_essence/earth = 10)

// TIER 2
/datum/infusion_recipe/t2_fire
	name = "Infernal Shift"
	target_type = /obj/item/natural/iridescentscale
	result_type = /obj/item/natural/hellhoundfang
	required_essences = list(/datum/thaumaturgical_essence/fire = 20, /datum/thaumaturgical_essence/chaos = 20)
/datum/infusion_recipe/t2_fae
	name = "Fae Shift"
	target_type = /obj/item/natural/elementalshard
	result_type = /obj/item/natural/iridescentscale
	required_essences = list(/datum/thaumaturgical_essence/air = 20, /datum/thaumaturgical_essence/water = 20)
/datum/infusion_recipe/t2_stone
	name = "Elemental Shift"
	target_type = /obj/item/natural/hellhoundfang
	result_type = /obj/item/natural/elementalshard
	required_essences = list(/datum/thaumaturgical_essence/earth = 20, /datum/thaumaturgical_essence/order = 20)

// TIER 3
/datum/infusion_recipe/t3_fire
	name = "Infernal Shift"
	target_type = /obj/item/natural/heartwoodcore
	result_type = /obj/item/natural/moltencore
	required_essences = list(/datum/thaumaturgical_essence/fire = 20, /datum/thaumaturgical_essence/energia = 20)
/datum/infusion_recipe/t3_fae
	name = "Fae Shift"
	target_type = /obj/item/natural/elementalfragment
	result_type = /obj/item/natural/heartwoodcore
	required_essences = list(/datum/thaumaturgical_essence/air = 20, /datum/thaumaturgical_essence/light = 20)
/datum/infusion_recipe/t3_stone
	name = "Elemental Shift"
	target_type = /obj/item/natural/moltencore
	result_type = /obj/item/natural/elementalfragment
	required_essences = list(/datum/thaumaturgical_essence/earth = 20, /datum/thaumaturgical_essence/life = 20)

// TIER 4
/datum/infusion_recipe/t4_fire
	name = "Infernal Shift"
	target_type = /obj/item/natural/sylvanessence
	result_type = /obj/item/natural/abyssalflame
	required_essences = list(/datum/thaumaturgical_essence/fire = 20, /datum/thaumaturgical_essence/magic = 20)
/datum/infusion_recipe/t4_fae
	name = "Fae Shift"
	target_type = /obj/item/natural/elementalrelic
	result_type = /obj/item/natural/sylvanessence
	required_essences = list(/datum/thaumaturgical_essence/air = 20, /datum/thaumaturgical_essence/magic = 20)
/datum/infusion_recipe/t4_stone
	name = "Elemental Shift"
	target_type = /obj/item/natural/abyssalflame
	result_type = /obj/item/natural/elementalrelic
	required_essences = list(/datum/thaumaturgical_essence/earth = 20, /datum/thaumaturgical_essence/magic = 20)

// ---- ORE TRANSFORMATION RECIPES ----
// slow and tiered process to upgrade raw ore, starting at stone up to gold
// essence is cheapish as you can't jump steps, sell prices are low, and it's a tedious one at a time process
/datum/infusion_recipe/ore // in case we want to handle this as a set differently
	abstract_type = /datum/infusion_recipe/ore

/datum/infusion_recipe/ore/coal
	name = "Coal Transmutation"
	target_type = /obj/item/natural/stone
	result_type = /obj/item/ore/coal
	required_essences = list(
		/datum/thaumaturgical_essence/earth = 5,
	)

// copper
/datum/infusion_recipe/ore/copper
	name = "Copper Metallurgy"
	target_type = /obj/item/ore/coal
	result_type = /obj/item/ore/copper
	required_essences = list(
		/datum/thaumaturgical_essence/earth = 5,
	)

/datum/infusion_recipe/ore/tin
	name = "Tin Metallurgy"
	target_type = /obj/item/ore/copper
	result_type = /obj/item/ore/tin
	required_essences = list(
		/datum/thaumaturgical_essence/earth = 5,
	)

/datum/infusion_recipe/ore/iron
	name = "Iron Metallurgy"
	target_type = /obj/item/ore/tin
	result_type = /obj/item/ore/iron
	required_essences = list(
		/datum/thaumaturgical_essence/earth = 5,
	)

/datum/infusion_recipe/ore/silver
	name = "Silver Metallurgy"
	target_type = /obj/item/ore/iron
	result_type = /obj/item/alch/silverdust
	required_essences = list(
		/datum/thaumaturgical_essence/order = 5,
		/datum/thaumaturgical_essence/magic = 5,
	)

/datum/infusion_recipe/ore/gold
	name = "Gold Metallurgy"
	target_type = /obj/item/alch/silverdust
	result_type = /obj/item/alch/golddust
	required_essences = list(
		/datum/thaumaturgical_essence/order = 5,
		/datum/thaumaturgical_essence/light = 5,
	)

// ---- GEM TRANSFORMATION RECIPES ----
// stone to artificial gems...
// essence requirements based on related form schools of `datum\unfinished_spellbook\spellcraft_contributions\gem`
/datum/infusion_recipe/gem
	abstract_type = /datum/infusion_recipe/gem
	target_type = /obj/item/natural/stone
	var/artificial_price = 18 // same as artifical amethortz
	var/artifical_desc = " This is clearly a cheap and infused immitation."

/datum/infusion_recipe/gem/gemerald
	name = "Verdant Gemerald"
	result_type = /obj/item/gem/green
	required_essences = list(
		/datum/thaumaturgical_essence/life = 30,
		/datum/thaumaturgical_essence/earth = 20,
		/datum/thaumaturgical_essence/crystal = 10,
	)

/datum/infusion_recipe/gem/blortz
	name = "Frosty Blortz"
	result_type = /obj/item/gem/blue
	required_essences = list(
		/datum/thaumaturgical_essence/water = 30,
		/datum/thaumaturgical_essence/frost = 20,
		/datum/thaumaturgical_essence/crystal = 10,
	)

/datum/infusion_recipe/gem/rontz
	name = "Firey Rontz"
	result_type = /obj/item/gem/red
	required_essences = list(
		/datum/thaumaturgical_essence/fire = 30,
		/datum/thaumaturgical_essence/life = 20,
		/datum/thaumaturgical_essence/crystal = 10,
	)

/datum/infusion_recipe/gem/toper
	name = "Electrified Topor"
	result_type = /obj/item/gem/yellow
	required_essences = list(
		/datum/thaumaturgical_essence/energia = 30,
		/datum/thaumaturgical_essence/air = 20,
		/datum/thaumaturgical_essence/crystal = 10,
	)

/datum/infusion_recipe/gem/dorpal
	name = "Gliterring Dorpal"
	result_type = /obj/item/gem/diamond
	// slightly more expensive since it's a good gem
	required_essences = list(
		/datum/thaumaturgical_essence/order = 40,
		/datum/thaumaturgical_essence/magic = 30,
		/datum/thaumaturgical_essence/crystal = 20,
	)

/datum/infusion_recipe/gem/saffira
	name = "Mystical Saffira"
	result_type = /obj/item/gem/violet
	// more expensive since this makes expert tier tomes instead of adept
	required_essences = list(
		/datum/thaumaturgical_essence/magic = 50,
		/datum/thaumaturgical_essence/chaos = 20,
		/datum/thaumaturgical_essence/crystal = 20,
	)

/datum/infusion_recipe/gem/onyxa
	name = "Sinister Onyxa"
	result_type = /obj/item/gem/onyxa
	required_essences = list(
		/datum/thaumaturgical_essence/death = 30,
		/datum/thaumaturgical_essence/magic = 20,
		/datum/thaumaturgical_essence/crystal = 10,
	)

/datum/infusion_recipe/gem/amythortz
	name = "Magickal Amythortz"
	result_type = /obj/item/gem/amethyst
	required_essences = list(
		/datum/thaumaturgical_essence/magic = 30,
		/datum/thaumaturgical_essence/frost = 20,
		/datum/thaumaturgical_essence/crystal = 10,
	)

/datum/infusion_recipe/gem/joapstone
	name = "Vivacious Joapstone"
	result_type = /obj/item/gem/jade
	required_essences = list(
		/datum/thaumaturgical_essence/life = 30,
		/datum/thaumaturgical_essence/earth = 20,
		/datum/thaumaturgical_essence/crystal = 10,
	)

/datum/infusion_recipe/gem/petriamber
	name = "Earthly Petriamber"
	result_type = /obj/item/gem/amber
	required_essences = list(
		/datum/thaumaturgical_essence/earth = 30,
		/datum/thaumaturgical_essence/fire = 20,
		/datum/thaumaturgical_essence/crystal = 10,
	)

/datum/infusion_recipe/gem/opaloise
	name = "Shimmering Opaloise"
	result_type = /obj/item/gem/opal
	required_essences = list(
		/datum/thaumaturgical_essence/magic = 30,
		/datum/thaumaturgical_essence/light = 20,
		/datum/thaumaturgical_essence/crystal = 10,
	)

/datum/infusion_recipe/gem/ceruleabaster
	name = "Bubbling Ceruleabaster"
	result_type = /obj/item/gem/turq
	required_essences = list(
		/datum/thaumaturgical_essence/water = 30,
		/datum/thaumaturgical_essence/air = 20,
		/datum/thaumaturgical_essence/crystal = 10,
	)

// ---- HUMOUR TRANSFORMATION RECIPES ----
// humours can be found at code\datums\chimeric_organs
/datum/infusion_recipe/humour
	abstract_type = /datum/infusion_recipe/humour
	target_type = /obj/item/chimeric_node
	result_type = /obj/item/chimeric_node
	var/datum/chimeric_node/node_type // support specifying the humour type for humour transformation

// ---- INPUT type humours ----
// most of these are balanced around 20ish essence requirement

/datum/infusion_recipe/humour/heartbeat
	name = "Heartbeat Synced Humour"
	required_essences = list(/datum/thaumaturgical_essence/life = 10, /datum/thaumaturgical_essence/cycle = 10, /datum/thaumaturgical_essence/motion = 5)
	node_type = /datum/chimeric_node/input/heartbeat

/datum/infusion_recipe/humour/wounded
	name = "Wounded Humour"
	required_essences = list(/datum/thaumaturgical_essence/fire = 10, /datum/thaumaturgical_essence/water = 10)
	node_type = /datum/chimeric_node/input/wounded

/datum/infusion_recipe/humour/sunlight
	name = "Sunblighted Humour"
	required_essences = list(/datum/thaumaturgical_essence/fire = 20)
	node_type = /datum/chimeric_node/input/sunlight

/datum/infusion_recipe/humour/stress
	name = "Stressed Humour"
	required_essences = list(/datum/thaumaturgical_essence/earth = 10, /datum/thaumaturgical_essence/poison = 10)
	node_type = /datum/chimeric_node/input/stress

/datum/infusion_recipe/humour/bleading
	name = "Wound Weeping Humour"
	required_essences = list(/datum/thaumaturgical_essence/life = 10, /datum/thaumaturgical_essence/water = 10)
	node_type = /datum/chimeric_node/input/bleeding

// ideally paired with healing comatose humour
/datum/infusion_recipe/humour/accumlated_damage
	name = "Responsive Humour"
	required_essences = list(/datum/thaumaturgical_essence/life = 10, /datum/thaumaturgical_essence/cycle = 5, /datum/thaumaturgical_essence/frost = 5)
	node_type = /datum/chimeric_node/input/accumlated_damage

// ---- OUTPUT type humours ----
// most of these are balanced around 40ish essence requirement

/datum/infusion_recipe/humour/clotting
	name = "Wound Clotting Humour"
	required_essences = list(/datum/thaumaturgical_essence/life = 20, /datum/thaumaturgical_essence/frost = 20)
	node_type = /datum/chimeric_node/output/clotting

// heals a specific randomly-chosen-on-humour-spawn damage type for like .5 per trigger
/datum/infusion_recipe/humour/healing
	name = "Restoring Humour"
	required_essences = list(/datum/thaumaturgical_essence/life = 40)
	node_type = /datum/chimeric_node/output/healing

/datum/infusion_recipe/humour/speed
	name = "Galewind Humour"
	required_essences = list(/datum/thaumaturgical_essence/motion = 20, /datum/thaumaturgical_essence/energia = 20)
	node_type = /datum/chimeric_node/output/speed

// ideally paired with responsive humour
/datum/infusion_recipe/humour/healing_coma
	name = "Comatose Humour"
	required_essences = list(/datum/thaumaturgical_essence/void = 10, /datum/thaumaturgical_essence/life = 10, /datum/thaumaturgical_essence/frost = 20)
	node_type = /datum/chimeric_node/output/healing_coma

// funny alcohol humour
/datum/infusion_recipe/humour/alcoholic
	name = "Distillery Humour"
	required_essences = list(/datum/thaumaturgical_essence/water = 20, /datum/thaumaturgical_essence/fire = 20)
	node_type = /datum/chimeric_node/output/alcoholic
