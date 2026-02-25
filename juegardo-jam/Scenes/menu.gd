extends Node3D

const PRESENTATION_DIALOGUE = preload("uid://bdxlks7dao2my")

@export var play_button : TextureButton
@export var animation_player : AnimationPlayer
@export var menu_controller : MenuController

func _ready() -> void:
	AudioManager.stream_player.playing = true

func _on_play_button_pressed():
	$"../../../MainMenuUI/ui/PlayButton/AudioStreamPlayer".playing = true
	AudioManager.reduce_volume_to_zero()
	#animation_player.play("iniciar")
	#menu_controller.hide_main_menu()
	GameManager.cargar_main()
	

func desactivar_boton():
	play_button.disabled = true

# se llama desde el animation player -> "iniciar"
func iniciar_dialogo_jefe():
	DialogueManager.show_dialogue_balloon(PRESENTATION_DIALOGUE, "dialogoAlma0")
