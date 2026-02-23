extends AnimatedSprite2D
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _physics_process(_delta: float) -> void:
		global_position = lerp(global_position, get_global_mouse_position(), 1)
	
		var desired_scale: Vector2 = Vector2(0.35, 0.35) if Input.is_action_pressed("click") else Vector2(0.4, 0.4)
	
		scale = lerp(scale, desired_scale, 1)
