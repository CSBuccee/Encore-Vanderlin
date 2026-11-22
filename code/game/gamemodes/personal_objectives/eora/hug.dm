/datum/objective/personal/hug_beggar
	name = "Hug a Beggar"
	category = "Pomette's Chosen"
	triumph_count = 2
	rewards = list("2 Triumphs", "Pomette grows stronger", "Become more empathetic")

/datum/objective/personal/hug_beggar/on_creation()
	. = ..()
	if(owner?.current)
		RegisterSignal(owner.current, COMSIG_MOB_HUGGED, PROC_REF(on_hug))
	update_explanation_text()

/datum/objective/personal/hug_beggar/Destroy()
	if(owner?.current)
		UnregisterSignal(owner.current, COMSIG_MOB_HUGGED)
	return ..()

/datum/objective/personal/hug_beggar/proc/on_hug(datum/source, mob/living/target)
	SIGNAL_HANDLER
	if(completed)
		return

	complete_objective()

/datum/objective/personal/hug_beggar/complete_objective()
	. = ..()
	to_chat(owner.current, span_greentext("You've hugged someone, completing Pomette's objective!"))
	adjust_storyteller_influence(POMETTE, 20)
	UnregisterSignal(owner.current, COMSIG_MOB_HUGGED)

/datum/objective/personal/hug_beggar/reward_owner()
	. = ..()
	ADD_TRAIT(owner.current, TRAIT_EMPATH, OBJECTIVE_TRAIT)

/datum/objective/personal/hug_beggar/update_explanation_text()
	explanation_text = "Everyone deserves love! Hug people to please Pomette!"
