extends Node3D

const ALMA_1 = preload("uid://cxi16kb2wu3h4")

@export var play_button : Button
@export var animation_player : AnimationPlayer
@export var menu_controller : MenuController

func _on_play_button_pressed():
	animation_player.play("iniciar")
	menu_controller.hide_main_menu()

func desactivar_boton():
	play_button.disabled = true

func iniciar_dialogo_jefe():
	DialogueManager.show_dialogue_balloon(ALMA_1, "dialogoAlma0")

func pruebaa():
	pass
