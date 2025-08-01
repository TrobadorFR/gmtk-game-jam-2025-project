@tool
extends State

@onready var coyote_timer := $"../../../../../CoyoteTime"

func _on_enter(args):
	target.gravity = target.FALLING_GRAVITY
	
	# Are we in coyote time?
	# Check if we were grounded last frame
	print(get_previous_active_states())
	if state_root.was_state_active("Grounded"):
		print("starting coyote time")
		target.coyote_time = true
		coyote_timer.start(target.COYOTE_TIME_DURATION)
	

func _on_coyote_time_timeout() -> void:
	target.coyote_time = false

func _on_update(delta):
	if target.velocity.y < 0:
		change_state("Rising")

func _on_exit(args):
	coyote_timer.stop()
	target.coyote_time = false
