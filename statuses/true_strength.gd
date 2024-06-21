class_name TrueStrenghtStatus
extends Status

const STRENGTH_STATUS = preload("res://statuses/strength.tres")

var stacks_per_turn := 2

func apply_status(target):
	print("Applied TrueStrenght")
	
	var status_effect := StatusEffect.new()
	var strength := STRENGTH_STATUS.duplicate()
	strength.stacks = stacks_per_turn
	status_effect.status = strength
	status_effect.execute([target])
	
	status_applied.emit(self)
