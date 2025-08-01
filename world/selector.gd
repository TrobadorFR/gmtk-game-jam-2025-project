extends CollisionShape2D


@onready var options: Node2D = $"../Options"
@onready var ray_cast: RayCast2D = $RayCast2D
@onready var option := options.get_children()

@onready var init_opt = $"Play"
var opt := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(option)
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_down"):
		opt = 0 if (opt + 1) >= option.size() else opt + 1
	if Input.is_action_just_pressed("ui_up"):
		opt = option.size()-1 if (opt - 1) < 0 else opt - 1
	
	self.global_position = Vector2(self.global_position.x, option[opt].global_position.y)
