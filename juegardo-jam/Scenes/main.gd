extends Node3D
const ALMA_1 = preload("uid://cxi16kb2wu3h4")

var almas = preload("res://Scenes/alma.tscn")
var instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (GameManager.alma_actual == 9):
		$mensaje_final.visible = true
	else:
		#DialogueManager.show_dialogue_balloon(ALMA_1, "dialogoAlma1")
		print("alma actual: ", GameManager.alma_actual)
		if not GameManager.activado:
			instantiate(Vector3(-2645, 0, -4585))
			GameManager.activado = true
			await get_tree().create_timer(2).timeout
			mostrar_dialogo(GameManager.alma_actual)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func instantiate(pos):
	instance = almas.instantiate()
	instance.position = pos
	add_child(instance)
	
func mostrar_dialogo(num_alma: int):
	DialogueManager.show_dialogue_balloon(ALMA_1, instance.dialogos[num_alma])
