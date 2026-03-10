extends Node
# Script registered as 'GameManager'

# --- CONFIGURATION ---
@export var max_turns : int = 3
@export var max_souls_per_turn : int = 3
@export var mask_evaluator : MaskEvaluatorClass

# --- SIGNALS ---
signal dialogue_start_requested
signal dialogue_finish_requested
signal main_scene_transition_requested
signal mask_chosen_requested(mask_index)
signal next_soul_requested

# --- STATE DATA ---
var current_soul_index : int = 0
var chosen_masks : Array[int] = [0,0,0,0,0,0,0,0,0]
var current_turn : int = 1
var souls_this_turn : int = 0

# --- CORE LOGIC ---
func confirm_mask_choice(mask_index : int) -> void:
	chosen_masks[mask_index] = 1
	mask_chosen_requested.emit(mask_index)

func finish_soul_interaction() -> void:
	current_soul_index += 1
	souls_this_turn += 1
	
	# Check if the turn (shift) is over
	if souls_this_turn >= max_souls_per_turn:
		current_turn += 1
		souls_this_turn = 0
	
	next_soul_requested.emit()
		
	
# --- DIALOGUE TRIGGERS ---
func trigger_dialogue_end() -> void:
	dialogue_finish_requested.emit()	

func trigger_dialogue_start() -> void:
	dialogue_start_requested.emit()

# --- SCENE ROUTING ---
func transition_to_main() -> void:
	main_scene_transition_requested.emit()
	#get_tree().change_scene_to_file("res://Scenes/main.tscn")
