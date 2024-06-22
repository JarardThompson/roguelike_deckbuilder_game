# meta-name: Relic
# meta-description: Create a Relic which can be aquired by the player.
extends Relic

var member_var := 0

func initalize_relic(_owner: RelicUI) -> void:
	print("This happens once we gain a new relic")

func activate_relic(_owner: RelicUI) -> void:
	print("This happens at specific times base on the Relic.Type property")

func deactivate_relic(_owner: RelicUI) -> void:
	print("This gets called when a RelicUI is exiting the SceenTree i.e getting deleted.")
	print("Event-based Relics should disconnect from the EventBus here.")

# we can provide unique tooltips per relic if we want to
func get_tooltip() -> String:
	return tooltip
