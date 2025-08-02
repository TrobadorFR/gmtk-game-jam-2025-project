@tool
extends State

func _on_update(delta):
	if abs(target.velocity.x) > 0.05:
		change_state("Walking")
