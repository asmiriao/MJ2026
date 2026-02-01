extends Node
const ALMA_1 = preload("uid://cxi16kb2wu3h4")

var instance
var activado = false
var almas = preload("res://Scenes/alma.tscn")
var alma_actual: int = 0

var mascaras_elegidas = [0,0,0,0,0,0,0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enter_shadow():
	pass
	if not activado:
		instantiate(Vector3(-2645, 0, -4585))
		activado = true
		await get_tree().create_timer(2).timeout
		mostrar_dialogo(alma_actual)
		#DialogueManager.show_dialogue_balloon(ALMA_1, "dialogoAlma1")
	


func instantiate(pos):
	instance = almas.instantiate()
	instance.position = pos
	add_child(instance)
	
func shadow_disappear():
	get_tree().call_group("Almas","animacion_desaparecer")
	instance.desaparecer()

func mostrar_dialogo(num_alma: int):
	DialogueManager.show_dialogue_balloon(ALMA_1, instance.dialogos[alma_actual])
	
func cargar_main():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func cargar_mascaras():
	get_tree().change_scene_to_file("res://Scenes/mascarass.tscn")
	
func fin():
	print("fin")
