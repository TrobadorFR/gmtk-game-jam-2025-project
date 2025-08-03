extends Character

func can_jump():
	return false



func _on_change_anim(state: String) -> void:
	if state == "walking":
		anim.set_animation("walk")
		$WalkAudio.play()
	else:
		anim.set_animation("idle")
		$WalkAudio.stop()
