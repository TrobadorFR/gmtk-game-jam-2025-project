extends Node2D
## Manages all characters in the scene.
## Handles attaching controllers to characters and disabling them when out of
## view.

@onready var characters := get_children()
var player_controller : PlayerController
var starting_character : Character

func _ready(): 
	SignalBus.connect("switch_player_character", switch_player_character)
	
	# setting initial character. for testing.
	#print(characters[0])
	#starting_character.add_child(player_controller)
	player_controller = $Character/PlayerController
	starting_character = $Character
	player_controller.current_character = starting_character
	player_controller.enabled = true
	starting_character.ai_controller.enabled = false
	
	print(characters)

var dbg_char := 0
func switch_player_character(character: Character):
	# keep old char, gotta do things to it
	var old_char = player_controller.current_character
	# since we don't have any mechanics implemented for switching atm, we just
	# cycle between the existing characters. 
	var new_char : Character = characters[dbg_char]
	
	print("Reparenting player controller from %s to %s" % [old_char.name, new_char.name])
	dbg_char = 0 if (dbg_char + 1) >= characters.size() else dbg_char + 1
	
	# disable ai on new char
	new_char.ai_controller.enabled = false
	
	# switch the player controller's associations
	player_controller.reparent(new_char)
	player_controller.current_character = new_char
	player_controller.global_position = new_char.global_position
	# we can shoot a signal here if we want player_controller to do things
	# once it receives its new character.
	
	# reactivate ai on old char
	old_char.ai_controller.enabled = true
