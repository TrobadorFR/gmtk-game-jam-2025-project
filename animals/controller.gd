class_name Controller
extends Node2D

var current_character : Character
var enabled : bool = false

func _ready():
	#if current_character is not Character:
		#printerr(
			#"ERROR: Controller %s is child of node %s of type %s, should be Character instead" % [
				#self.get_path(), 
				#get_parent().get_path(), 
				#get_parent().get_class()
			#]
		#)
	# DISABLED for now because it's giving errors when it shouldn't
	pass
