class_name PlayerController
extends Controller



func _physics_process(delta: float) -> void:
	if enabled:
		current_character.commands.movement = Input.get_axis("ui_left", "ui_right")
		
		current_character.commands.jump = Input.is_action_just_pressed("ui_up")
		current_character.commands.interact = Input.is_action_just_pressed("ui_accept")
		
		if Input.is_action_just_pressed("dbg_switch_char"):
			SignalBus.emit_signal("switch_character")
