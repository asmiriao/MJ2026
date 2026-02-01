extends Node
const ALMA_1 = preload("uid://cxi16kb2wu3h4")

@onready var alma: CharacterBody3D = $Alma

var instance
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
		instantiate(Vector3(-2645, 0, -4585))
		activado = true
		await get_tree().create_timer(2).timeout
		DialogueManager.show_dialogue_balloon(ALMA_1, "dialogoAlma1")
		


func instantiate(pos):
	instance = almas.instantiate()
	instance.position = pos
	add_child(instance)
	
func shadow_disappear():
	instance.desaparecer()
	
	
