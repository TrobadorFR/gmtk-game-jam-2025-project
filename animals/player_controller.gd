class_name PlayerController
extends Controller

func _process(delta: float) -> void:	
	if enabled:
		# Process commands and send it to the character
		current_character.commands.movement = Input.get_axis("ui_left", "ui_right")
		
		current_character.commands.jump = Input.is_action_just_pressed("ui_up")
		current_character.commands.interact = Input.is_action_just_pressed("ui_accept")
		
		if Input.is_action_just_pressed("dbg_switch_char"):
			SignalBus.emit_signal("switch_player_character", null)
			# TODO: this must include the reference to the next character later
		
