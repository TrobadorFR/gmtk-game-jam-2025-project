extends Node2D

@onready var world: Node2D = $World
@onready var selector: CollisionShape2D = $Selector

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var current_option = selector.ray_cast.get_collider()
	
	if selector.ray_cast.is_colliding():
		if current_option.is_in_group("Play") and Input.is_action_just_pressed("ui_accept"):
			world.visible = true
			self.visible = false
		if current_option.is_in_group("other option") and Input.is_action_just_pressed("ui_accept"):
			
			self.visible = false
		if current_option.is_in_group("some other option") and Input.is_action_just_pressed("ui_accept"):
			
			self.visible = false
		
