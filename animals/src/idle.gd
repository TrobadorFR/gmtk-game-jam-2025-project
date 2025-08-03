@tool
extends State

func _on_enter(args):
	target.emit_signal("change_anim", "idle")


func _on_update(delta):
	if abs(target.velocity.x) > 0.05:
		change_state("Walking")
