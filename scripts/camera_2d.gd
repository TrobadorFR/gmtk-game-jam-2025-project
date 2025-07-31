extends Camera2D

const NUMBER_OF_PLAY_CHAR = 3

@onready var character_body_2d: CharacterBody2D = %CharacterBody2D
@onready var character_body_2d_2: CharacterBody2D = %CharacterBody2D2
@onready var character_body_2d_3: CharacterBody2D = %CharacterBody2D3


var counter = 0

func _process(delta):
	if Input.is_action_just_pressed("SwitchCharacter"):
		counter += 1
		match int(counter%NUMBER_OF_PLAY_CHAR):
			0: reparent(character_body_2d, false)
			1: reparent(character_body_2d_2, false)
			2: reparent(character_body_2d_3, false)
