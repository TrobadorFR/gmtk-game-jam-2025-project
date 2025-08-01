class_name PlayerController
extends Controller
## Controller that takes player input to send CommandPackages.
## Only one PlayerController exists in the scene. The CharacterManager is in 
## charge of changing the attachment of this Controller when signaled to change
## characters.

@export var INPUT_BUFFER_FRAME_COUNT : int = 5

var jump_buffer : int = 0
var interact_buffer : int = 0

func _physics_process(_delta: float) -> void:
	# IMPORTANT:
	# I am *fairly certain* that this method causes an issue due to the order of
	# physics_process calls by different nodes being incertain.
	# However, I can't see them, and _process was worse. For now, I'm leaving
	# this as it is.
	if enabled:
		if Input.is_action_just_pressed("gp_jump"):
			jump_buffer = INPUT_BUFFER_FRAME_COUNT
		if Input.is_action_just_pressed("gp_action"):
			interact_buffer = INPUT_BUFFER_FRAME_COUNT
		
		# Process commands and send it to the character
		var commands : CommandPackage = CommandPackage.new()
		
		commands.movement = Input.get_axis("gp_left", "gp_right")
		commands.jump = true if jump_buffer else false
		commands.interact = true if interact_buffer else false
		
		current_character.commands = commands
		
		jump_buffer = max(0, jump_buffer - 1)
		interact_buffer = max(0, interact_buffer - 1)
		
		if Input.is_action_just_pressed("dbg_switch_char"):
			#SignalBus.emit_signal("switch_player_character", null)
			SignalBus.emit_signal("dbg_cycle_characters")
			# TODO: this must include the reference to the next character later
		
