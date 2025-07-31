class_name PlayerController
extends Controller

func _physics_process(delta: float) -> void:
	# IMPORTANT:
	# I am *fairly certain* that this method causes an issue due to the order of
	# physics_process calls by different nodes being incertain.
	# However, I can't see them, and _process was worse. For now, I'm leaving
	# this as it is.
	if enabled:
		# Process commands and send it to the character
		var commands : CommandPackage = CommandPackage.new()
		
		commands.movement = Input.get_axis("ui_left", "ui_right")
		commands.jump = Input.is_action_just_pressed("ui_up")
		commands.interact = Input.is_action_just_pressed("ui_accept")
		
		current_character.commands = commands
		
		if Input.is_action_just_pressed("dbg_switch_char"):
			SignalBus.emit_signal("switch_player_character", null)
			# TODO: this must include the reference to the next character later
		
