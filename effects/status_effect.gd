class_name StatusEffect
extends Effect

var status: Status

func execute(targets: Array[Node]) -> void:
	if status == null:
		print("Status is null in StatusEffect.execute")
		return
	
	for target in targets:
		if not target:
			continue
		if target is Enemy or target is Player:
			target.status_handler.add_status(status)
