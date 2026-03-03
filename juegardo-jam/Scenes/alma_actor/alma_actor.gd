extends AnimatedSprite3D

@export_enum("carnaval", "clown", "maori", "moretta", "peste", "victoriana", "white") var mask_owned : String = "carnaval"

@export var MaskEvaluator : MaskEvaluatorClass

func _ready() -> void:
	MaskEvaluator.soul_owned_mask = mask_owned
