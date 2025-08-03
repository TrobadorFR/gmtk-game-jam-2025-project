extends Character

func _ready() -> void:
	super._ready()
	anim.set_animation("idle")


func _on_change_anim(state: String) -> void:
	if state == "idle":
		anim.set_animation("idle")
	elif state == "walking":
		anim.set_animation("walk")
	elif state == "rising":
		anim.set_animation("fly_up")
	elif state == "falling":
		anim.set_animation("fly_down")
