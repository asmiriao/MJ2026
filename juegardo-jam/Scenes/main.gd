extends Node3D

# --- CONFIGURATION ---
const DIALOGUE_RESOURCE = preload("uid://cxi16kb2wu3h4")
const SOUL_SCENE = preload("res://Scenes/alma.tscn")
@export var spawn_position : Vector3 = Vector3(-2645, 0, -4585)
@export var camera_controls : Control 
# --- NODE REFERENCES ---
@onready var final_message_ui = $mensaje_final

# --- STATE ---
var active_soul_node : Node = null

# --- LIFECYCLE ---
func _ready() -> void:
	# Listen to GameManager's events
	GameManager.dialogue_finish_requested.connect(show_camera_controls)
	GameManager.dialogue_start_requested.connect(hide_camera_controls)
	# Disable camera controls on start
	camera_controls.visible = false
	
	# Check for Win/End State
	if GameManager.current_soul_index == 9:
		final_message_ui.visible = true
		return
	
	# Standard Game Loop
	spawn_soul(spawn_position)
	
	await get_tree().create_timer(2.0).timeout
	show_dialogue(GameManager.current_soul_index)

# --- WORLD LOGIC ---
func vanish_active_soul() -> void:
	get_tree().call_group("Almas","animacion_desaparecer")
	if is_instance_valid(active_soul_node):
		active_soul_node.play_disappear_anim()
		
func spawn_soul(pos : Vector3) -> void:
	active_soul_node = SOUL_SCENE.instantiate()
	active_soul_node.position = pos
	add_child(active_soul_node)
	
func show_dialogue(soul_index: int) -> void:
	if is_instance_valid(active_soul_node):
		DialogueManager.show_dialogue_balloon(DIALOGUE_RESOURCE, active_soul_node.dialogues[soul_index])

func show_camera_controls() -> void:
	camera_controls.visible = true

func hide_camera_controls() -> void:
	camera_controls.visible = false
