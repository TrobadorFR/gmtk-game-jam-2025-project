class_name BaseAIController
extends Controller
# Base controller 

func _ready():
	current_character = get_parent()
	super._ready() # Primarily for error handling
	enabled = true
