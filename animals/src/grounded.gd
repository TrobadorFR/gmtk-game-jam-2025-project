@tool
extends State

func _on_enter(args):
	target.speed = target.GROUND_SPEED

func _on_update(delta):
	if not target.is_on_floor():
		change_state("Airborne")
