@tool
extends State


func _on_enter(args):
	target.gravity = target.RISING_GRAVITY
	target.emit_signal("change_anim", "rising")

func _on_update(delta):
	if target.velocity.y > 0:
		change_state("Falling")
