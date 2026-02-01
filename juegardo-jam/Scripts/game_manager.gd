extends Node
const ALMA_1 = preload("uid://cxi16kb2wu3h4")

@onready var alma: CharacterBody3D = $Alma

var activado = false
var almas = preload("res://Scenes/alma.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enter_shadow():
	 
	if not activado:
		activado = true
		await get_tree().create_timer(2).timeout
		DialogueManager.show_dialogue_balloon(ALMA_1, "dialogoAlma1")
		
func shadow_disappear():
	pass
