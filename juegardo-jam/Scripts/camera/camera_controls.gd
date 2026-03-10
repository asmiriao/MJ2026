extends Camera3D

# --- CONFIGURATION ---
@export var transition_speed : float = 0.6

# Where the camera should stop rotating
@export var turn_amount_degrees : float = 180.0

# --- STATE ---
var current_target_rotation : float = 0.0
var is_moving : bool = false

func _ready() -> void:
	# Snap to the first angle on load
	current_target_rotation = rotation.y

# --- INPUT TRIGGERS ---
func turn_right() -> void:
	if is_moving:
		return
	
	current_target_rotation -= deg_to_rad(turn_amount_degrees)
	animate_rotation()
	
func turn_left() -> void:
	if is_moving:
		return
	
	current_target_rotation += deg_to_rad(turn_amount_degrees)
	animate_rotation()
	
# --- ANIMATION ---
func animate_rotation( ) -> void:
	is_moving = true

	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "rotation:y", current_target_rotation, transition_speed)
	tween.tween_callback(func(): is_moving = false)


# --- UI BUTTONS ---
func _on_turn_left_button_pressed() -> void:
	turn_left()


func _on_turn_right_button_pressed() -> void:
	turn_right()
