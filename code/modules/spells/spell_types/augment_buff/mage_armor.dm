/datum/action/cooldown/spell/augment_buff/mage_armor
	name = "Mage Armor"
	desc = "Weaves a ward of arcyne force around a target."
	button_icon_state = "stoneskin"

	spell_cost = 40

	invocation = "Tegmen!"
	invocation_type = INVOCATION_SHOUT
	required_form = FORM_ARCANE

	cooldown_time = 1 MINUTES

/datum/action/cooldown/spell/augment_buff/mage_armor/cast(atom/cast_on)
	. = ..()
	var/mob/living/carbon/human/H = owner
	if(!istype(H))
		return FALSE
	if(!ishuman(cast_on))
		to_chat(H, span_warning("That is not a valid target!"))
		return FALSE
	var/mob/living/carbon/human/target = cast_on

	if(target.skin_armor && !istype(target.skin_armor, /obj/item/clothing/armor/skin_armor/mage_armor))
		to_chat(H, span_warning("[target == H ? "My" : "[target]'s"] skin is already warded by something else!"))
		return FALSE

	target.apply_status_effect(/datum/status_effect/buff/mage_armor)
	if(target != H)
		H.Beam(target, icon_state = "b_beam", time = 1.5 SECONDS)
	target.visible_message(span_warning("A faint shimmer of force settles over [target]!"), \
		span_notice("An arcyne ward hardens around my body."))
	new /obj/effect/temp_visual/spell_impact(get_turf(target), spell_color, spell_impact_intensity)
	return TRUE
