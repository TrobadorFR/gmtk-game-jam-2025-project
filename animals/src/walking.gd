@tool
extends State

func _on_enter(args):
	$"../../../../../WalkParticle".emitting = true
	target.emit_signal("change_anim", "walking")

func _on_update(delta):
	if abs(target.velocity.x) < 0.05:
		change_state("Idle")

func _on_exit(args):
	$"../../../../../WalkParticle".emitting = false
