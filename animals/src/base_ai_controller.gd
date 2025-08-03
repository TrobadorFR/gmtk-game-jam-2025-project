class_name BaseAIController
extends Controller
## Default controller for any Character node. Whenever a Character is not being
## controlled by another Controller such as PlayerController, the 
## BaseAIController should be active. Otherwise, it should be disabled.

var timer : float = 0.0
var timer_max : float = 1.0
var direction : float = 0.5

func _ready():
	var parent = get_parent()
	current_character = get_parent()
	super._ready() # Primarily for error handling
	enabled = true

func _physics_process(delta: float) -> void:
	# Simple idle routine. 
	if enabled:
		timer += delta 
		if timer >= timer_max:
			timer = 0
			direction = -direction
			#timer_max = randf_range(2.0, 6.0)
		
		var commands : CommandPackage = CommandPackage.new()
		commands.movement = direction
		current_character.commands = commands
