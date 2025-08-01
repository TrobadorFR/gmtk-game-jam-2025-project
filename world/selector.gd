extends CollisionShape2D


@onready var ray_cast: RayCast2D = $RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(Vector2(0, 0), Vector2(50, 100))
	var result = space_state.intersect_ray(query)

	if result:
		print(result)
