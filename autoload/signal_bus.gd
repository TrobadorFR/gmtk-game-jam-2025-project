extends Node
## Signal bus singleton.
## This will hold all our signals in one script, to make them easier to access.

signal change_scene(scene_name: String)
signal switch_player_character(character: Character) # later, include character id
