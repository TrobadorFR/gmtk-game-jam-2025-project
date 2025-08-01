@tool
extends State

func _on_enter(args):
	target.gravity = target.RISING_GRAVITY

func _on_update(delta):
	if target.velocity.y > 0:
		change_state("Falling")
