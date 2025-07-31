extends CharacterBody2D

const SPEED = 10.0
const JUMP_VELOCITY = -400.0
const UNIQUE_ID = 1
const NUMBER_OF_PLAY_CHAR = 3

var tag = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("SwitchCharacter"):
		tag += 1

	if tag%NUMBER_OF_PLAY_CHAR == UNIQUE_ID:
		# Handle jump.
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("Left", "Right")
		if direction:
			velocity.x = direction * SPEED * delta * 1000
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
