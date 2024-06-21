class_name StrengthStatus
extends Status

func initialize_status(_target):
	status_changed.connect(_on_status_changed)
	_on_status_changed()

func _on_status_changed() -> void:
	print("Strength status: +%s damage" % stacks)
