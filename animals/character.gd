class_name Character
extends CharacterBody2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

## Commands received from controller
class CommandPackage extends RefCounted: # RAAH THIS SUCKS
	var jump : bool = false
	var interact : bool = false
	## Movement axis obtained from controller
	var movement : float = 0.0

var commands : CommandPackage = CommandPackage.new()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if commands.jump and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = commands.movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func jump():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
