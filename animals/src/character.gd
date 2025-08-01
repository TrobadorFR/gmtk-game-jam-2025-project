class_name Character
extends CharacterBody2D 
## Character in the game. Takes Commands from an attached Controller.

@export var GROUND_SPEED = 300.0
@export var AIR_SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var RISING_GRAVITY = 980.0
@export var FALLING_GRAVITY = 980.0
@export var COYOTE_TIME_DURATION = 0.2

## AI controller. Enabled by default on every character, should be on if no 
## other controller is active. Managed by CharacterManager.
@onready var ai_controller := $BaseAIController

## Commands received from controller
var commands : CommandPackage
## Coyote time managed by Falling state
var coyote_time : bool = false

## Movement speed of the character. This defaults to ground speed and is later
## set by Grounded and Airborne states accordingly.
@onready var speed = GROUND_SPEED
## Gravity of the character. This defaults to falling gravity and is later set
## by Rising and Falling states accordingly.
@onready var gravity = FALLING_GRAVITY

func _ready() -> void:
	# Some issues can crop up if the state machine starts Active if our code
	# touches any nodes that aren't ready yet.
	# To prevent this, we start with PreInit, which does nothing, and switch to
	# Active when ready.
	$Root.change_state("Active")

func _physics_process(delta: float) -> void:
	#debug
	#$CollisionBox.debug_color = Color("red") if coyote_time else Color("green")
	pass

func jump() -> void:
	velocity.y = JUMP_VELOCITY

## Returns whether the character is allowed to jump. Takes in account 
## is_on_floor and coyote_time and can be overridden (Bird)
func can_jump() -> bool:
	return is_on_floor() or coyote_time
