@tool
extends State

func _on_enter(args):
	$"../../../../../WalkParticle".emitting = true

func _on_update(delta):
	if abs(target.velocity.x) < 0.05:
		change_state("Idle")

func _on_exit(args):
	$"../../../../../WalkParticle".emitting = false
