extends Sprite3D

@export_enum("carnaval", "clown", "maori", "moretta", "peste", "victoriana", "white") var mask_type : String = "carnaval"
@export var base_texture : Texture2D
@export var outline_texture : Texture2D

@export var MaskEvaluator : MaskEvaluatorClass

@onready var manager_test = %ManagerTest

var agotada = false

func _ready():
	$Label3D.text = "mascara " + mask_type
	texture = base_texture

func _on_mascara_mouse_entered() -> void:
	texture = outline_texture

func _on_mascara_mouse_exited() -> void:
	texture = base_texture

func _on_mascara_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if agotada: pass
	if (event.is_action_pressed("click")):
		print("seleccionada: máscara " + mask_type)
		manager_test.alma_actual.acertada = MaskEvaluator.mask_selected_compare(mask_type)
		print("máscara correcta: " + str(manager_test.alma_actual.acertada))
		mascara_entregada()

func mascara_entregada():
	manager_test.array_mascaras_seleccionadas.append(mask_type)
	print("máscaras agotadas: " + str(manager_test.array_mascaras_seleccionadas))
	agotada = true
	visible = false
	manager_test.cliente_atendido()
