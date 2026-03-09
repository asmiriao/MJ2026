extends Node
# Script registered as 'GameManager'

# --- SIGNALS ---
signal soul_vanish_requested 
signal volume_transition_requested

# --- STATE DATA ---
var current_soul_index : int = 0
var chosen_masks : Array[int] = [0,0,0,0,0,0,0,0,0]

func confirm_mask_choice(mask_index : int) -> void:
	chosen_masks[mask_index] = 1
	current_soul_index += 1
	load_main_scene()
	
# --- DIALOGUE TRIGGERS ---
func trigger_shadow_vanish() -> void:
	soul_vanish_requested.emit()

# --- SCENE ROUTING ---
func load_main_menu() -> void:
	volume_transition_requested.emit()
	#get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func load_mask_scene() -> void:
	get_tree().change_scene_to_file("res://Scenes/masks.tscn")
	
func load_main_scene() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
