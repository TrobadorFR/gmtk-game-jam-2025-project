extends Node2D
## Manages all characters in the scene.
## Handles attaching controllers to characters and disabling them when out of
## view.

@onready var characters := get_children()
var player_controller : PlayerController
var starting_character : Character
@onready var camera := $"../PhantomCamera2D"

func _ready(): 
	SignalBus.connect("switch_player_character", switch_player_character)
	SignalBus.connect("dbg_cycle_characters", dbg_switch_char)
	
	# setting initial character. for testing.
	#print(characters[0])
	#starting_character.add_child(player_controller)
	player_controller = $Bird/PlayerController
	starting_character = $Bird
	
	player_controller.current_character = starting_character
	player_controller.enabled = true
	
	starting_character.ai_controller.enabled = false
	# for whatever reason, monitorable doesn't seem to prevent 
	# get_overlapping_areas from returning the starting character here
	# after discussing this on discord it seems like a bug in the engine
	# TODO: make an issue about it
	starting_character.interactable_range.set_collision_layer_value(3, false)
	#starting_character.interactable_range.set_deferred("monitorable", false)

var dbg_char := 0
func dbg_switch_char():
	SignalBus.emit_signal("switch_player_character", characters[dbg_char])
	dbg_char = 0 if (dbg_char + 1) >= characters.size() else dbg_char + 1

func switch_player_character(new_char: Character):
	# keep old char, gotta do things to it
	var old_char = player_controller.current_character
	print("CharacterManager: Reattaching PlayerController from %s to %s" % [old_char.name, new_char.name])
	
	# disable ai on new char
	new_char.ai_controller.enabled = false
	new_char.interactable_range.set_collision_layer_value(3, false)
	#new_char.interactable_range.set_deferred("monitorable", false)
	
	# switch the player controller's associations
	player_controller.reparent(new_char)
	player_controller.current_character = new_char
	player_controller.global_position = new_char.global_position
	# we can shoot a signal here if we want player_controller to do things
	# once it receives its new character.
	
	# Follow new character
	camera.follow_target = new_char
	
	# reactivate ai on old char
	old_char.ai_controller.enabled = true
	old_char.interactable_range.set_collision_layer_value(3, true)
	#old_char.interactable_range.set_deferred("monitorable", true)
	
	$SwitchAudio.play()
