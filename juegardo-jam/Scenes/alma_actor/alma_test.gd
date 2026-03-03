extends Node3D

@export_enum("carnaval", "clown", "maori", "moretta", "peste", "victoriana", "white") var mask_owned : String = "carnaval"

@export var mask_evaluator : MaskEvaluatorClass
@onready var animation_player = $AnimationPlayer

var atendida = false
var acertada = false

func _ready() -> void:
	$AlmaActor/Label3D.text = "alma " + mask_owned

func entrar_tienda():
	mask_evaluator.soul_owned_mask = mask_owned
	visible = true
	animation_player.play("entrar")
	
func salir_tienda():
	atendida = true
	animation_player.play("salir")
