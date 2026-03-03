extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(preload("uid://cxi16kb2wu3h4"), "dialogoAlma1")
