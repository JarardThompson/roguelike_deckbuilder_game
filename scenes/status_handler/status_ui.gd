class_name StatusUI
extends Control

@export var status: Status : set = set_status

@onready var icon: TextureRect = $Icon
@onready var duration: Label = $Duration
@onready var stacks: Label = $Stacks

func set_status(new_status: Status) -> void:
	status = new_status
	if not is_inside_tree():
		await_to_be_inside_tree()
	update_status_ui()

func update_status_ui() -> void:
	icon.texture = status.icon
	duration.visible = status.stack_type == Status.StackType.DURATION
	stacks.visible = status.stack_type == Status.StackType.INTENSITY
	custom_minimum_size = icon.size
	
	if duration.visible:
		custom_minimum_size = stacks.size + stacks.position
	elif stacks.visible:
		custom_minimum_size = stacks.size + stacks.position
	
	if not status.status_changed.is_connected(_on_status_changed):
		status.status_changed.connect(_on_status_changed)
	
	_on_status_changed()

func await_to_be_inside_tree() -> void:
	while not is_inside_tree():
		await get_tree().process_frame

func _on_status_changed() -> void:
	if not status:
		return
	
	if status.can_expire and status.duration <=0:
		queue_free()
	
	if status.stack_type == Status.StackType.INTENSITY and status.stacks == 0:
		queue_free()
	
	duration.text = str(status.duration)
	stacks.text = str(status.stacks)
