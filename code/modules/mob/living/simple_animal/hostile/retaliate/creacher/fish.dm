/mob/living/simple_animal/hostile/retaliate/fish
	name = "ugly fish"
	faction = list("deepone", "Neutral")//neutral so it doesnt get chased by guards into the ocean

//Sprites
	icon = 'icons/roguetown/mob/monster/fish.dmi'
	icon_state = "angler"
	icon_living = "angler"
	icon_dead = "angler_dead"

//Descriptors and emotes
	mob_size = MOB_SIZE_HUMAN
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	footstep_type = null
	emote_hear = null
	emote_see = null
	verb_say = "glubs"
	verb_ask = "glibs"
	verb_exclaim = "gurgles"
	verb_yell = "bubbles"
	speak_emote = list("glorps")

//Vision, aggro and ai control
	ai_controller = /datum/ai_controller/fish
	simple_detect_bonus = 25
	see_in_dark = 3
	retreat_distance = 3
	minimum_distance = 1
	deaggroprob = 50
	retreat_health = 35
	food_max = 25

//Damages, health and resistances
	health = FISH_HEALTH
	maxHealth = FISH_HEALTH
	base_intents = list(/datum/intent/simple/bite)
	melee_damage_lower = 10
	melee_damage_upper = 20
	obj_damage = 35
	environment_smash = ENVIRONMENT_SMASH_NONE

//Attributes
	base_constitution = 6
	base_strength = 5
	base_speed = 14
	base_endurance = 8

	defprob = 5
	defdrain = 25

	dodgetime = 25

//Butchering and remains
	botched_butcher_results = list(
		/obj/item/reagent_containers/food/snacks/meat/mince/fish = 2,
		/obj/item/alch/viscera = 2,
	)
	butcher_results = list(
		/obj/item/reagent_containers/food/snacks/meat/mince/fish = 4,
		/obj/item/alch/sinew = 4,
		/obj/item/alch/viscera = 4,
	)
	perfect_butcher_results = list(
		/obj/item/reagent_containers/food/snacks/meat/mince/fish= 6,
		/obj/item/natural/hide = 4,
		/obj/item/alch/sinew = 5,
		/obj/item/alch/viscera = 4,
	)

	remains_type = /obj/effect/decal/remains/fish
	animal_type = /datum/chimeric_table/triton

/obj/effect/decal/remains/fish
	desc = "Thin bones, the leftovers of a sad old fish."
	icon = 'icons/roguetown/mob/monster/fish.dmi'
	icon_state = "bones"

/mob/living/simple_animal/hostile/retaliate/fish/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_aggro_system)
	add_traits(list(TRAIT_NODROWN, TRAIT_SWIMMER), INNATE_TRAIT)

/mob/living/simple_animal/hostile/retaliate/fish/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "nose"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "gills"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "fins"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "fins"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "tail"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "tail"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "tail"
		if(BODY_ZONE_L_LEG)
			return "tail"
		if(BODY_ZONE_R_ARM)
			return "fins"
		if(BODY_ZONE_L_ARM)
			return "fins"
	return ..()
