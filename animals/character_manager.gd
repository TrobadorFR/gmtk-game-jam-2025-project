extends Node2D
## Manages all characters in the scene.
## Handles attaching controllers to characters and disabling them when out of
## view.

@onready var characters := get_children()
var player_controller

func _ready(): # temporary
	SignalBus.connect("switch_character", switch_character)
	for char in get_children():
		for child in char.get_children():
			if child is PlayerController:
				player_controller = child
	
func switch_character():
	var old_char = player_controller.current_character
	player_controller.current_character = characters[2]
	old_char.add_child(AIController.new())
	
