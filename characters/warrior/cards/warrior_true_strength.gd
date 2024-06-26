extends Card

const TRUE_STRENGTH_STATUS = preload("res://statuses/true_strength.tres")

func apply_effects(targets: Array[Node], _modifiers: ModifierHandler) -> void:
	var status_effect := StatusEffect.new()
	var true_strength := TRUE_STRENGTH_STATUS.duplicate()
	status_effect.status = true_strength
	status_effect.execute(targets)
