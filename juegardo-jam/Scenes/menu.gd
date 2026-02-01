extends Node3D

const ALMA_1 = preload("uid://cxi16kb2wu3h4")
@onready var button = $ui/Button
@onready var animation_player = $AnimationPlayer


func _on_button_pressed():
	animation_player.play("iniciar")
	
func desactivar_boton():
	button.disabled = true

func iniciar_dialogo_jefe():
	DialogueManager.show_dialogue_balloon(ALMA_1, "dialogoAlma0")

func pruebaa():
	pass
