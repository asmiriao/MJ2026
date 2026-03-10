extends Sprite3D

@export_enum("carnaval", "clown", "maori", "moretta", "peste", "victoriana", "white") var mask_type : String = "carnaval"
@export var base_texture : Texture2D
@export var outline_texture : Texture2D

@export var MaskEvaluator : MaskEvaluatorClass

func _on_mascara_mouse_entered() -> void:
	texture = outline_texture


func _on_mascara_mouse_exited() -> void:
	texture = base_texture

func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event.is_action_pressed("click")):
		visible = false
		var mask_correct : bool = MaskEvaluator.mask_selected_compare(mask_type)
		GameManager.confirm_mask_choice(0)
