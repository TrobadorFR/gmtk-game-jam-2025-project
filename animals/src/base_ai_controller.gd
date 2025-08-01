class_name BaseAIController
extends Controller
# Base controller 

var timer : float = 0.0
var timer_max : float = 1.0
var direction : float = 0.5

func _ready():
	current_character = get_parent()
	super._ready() # Primarily for error handling
	enabled = true

func _physics_process(delta: float) -> void:
	if enabled:
		timer += delta 
		if timer >= timer_max:
			timer = 0
			direction = -direction
			#timer_max = randf_range(2.0, 6.0)
		
		var commands : CommandPackage = CommandPackage.new()
		commands.movement = direction
		current_character.commands = commands
