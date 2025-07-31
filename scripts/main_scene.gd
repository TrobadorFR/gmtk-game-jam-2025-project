extends Node
## Project main scene.
## Takes care of loading and transitioning to other scenes.
## This is always the root node of everything. 
## To change to another scene using this, make sure it's in res://scenes/ 
## and emit "change_scene" with the name of the scene without the extension.
## This node will complete the path.

var current_scene : Node

func _ready():
	# We initialize current scene with the scene we've added as a child to the 
	# MainScene in the editor, being GameScene.
	current_scene = $GameScene # Probably could stand to not be hard coded but eh
	SignalBus.connect("change_scene", load_scene)
	
## Unload the current scene. 
## We split this from load_scene() so that we can do things before it
## if we want to, such as a fade in.
func unload_scene():
	if (is_instance_valid(current_scene)):
		current_scene.queue_free()
	current_scene = null

## Load a scene with the given name.
## Scene is assumed to be in the scenes directory. Do not include the .tscn
## extension in the given name.
## Generally called by signaling "change_scene".
func load_scene(scene_name : String):
	unload_scene()
	var scene_path := "res://scenes/%s.tscn" % scene_name 
	var scene := load(scene_path)
	if(scene):
		current_scene = scene.instantiate()
		add_child(current_scene)
