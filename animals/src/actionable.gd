@tool
extends State
## When the player is actionable AKA not doing anything (save for base movement)

func _on_update(delta):
	if target.commands: 
		#print("CommandPackage to player character: jump=%s, interact=%s, movement=%s" %
			#[target.commands.jump,
			#target.commands.interact,
			#target.commands.movement
			#]
		#)
		
		# Add the gravity.
		if not target.is_on_floor():
			target.velocity.y += target.gravity * delta

		# Handle jump.
		if target.commands.jump and target.can_jump():
			target.jump()

		# Get the input direction and handle the movement/deceleration.
		var direction = target.commands.movement
		if direction != 0.0:
			target.velocity.x = direction * target.speed
			# Flip the character based on direction.
			target.flip(direction)
		else:
			target.velocity.x = move_toward(target.velocity.x, 0, target.speed)
			
		target.move_and_slide()
		target.commands = null
