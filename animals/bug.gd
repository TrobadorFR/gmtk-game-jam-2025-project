extends Character

func _ready() -> void:
	super._ready()
	anim.set_animation("idle")


func _on_change_anim(state: String) -> void:
	if state == "idle":
		anim.set_animation("idle")
		$WalkAudio.stop()
	elif state == "walking":
		anim.set_animation("walk")
		$WalkAudio.play()
		$JumpAudio.stop()
	elif state == "rising":
		anim.set_animation("fly_up")
		$JumpAudio.play()
		$WalkAudio.stop()
	elif state == "falling":
		anim.set_animation("fly_down")
		$JumpAudio.play()
		$WalkAudio.stop()
