@tool
extends State

func _on_enter(args):
	target.speed = target.AIR_SPEED

func _on_update(delta):
	if target.is_on_floor():
		change_state("Grounded")
	
