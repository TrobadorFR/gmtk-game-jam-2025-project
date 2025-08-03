extends Character

func _ready() -> void:
	super._ready()


func can_jump():
	return true


func _on_change_anim(state: String) -> void:
	if state == "idle":
		anim.set_animation("idle")
		$WalkAudio.stop()
	else:
		anim.set_animation("fly")
		$WalkAudio.play()
