extends Node3D
const ALMA_1 = preload("uid://cxi16kb2wu3h4")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(ALMA_1, "dialogoAlma1")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
