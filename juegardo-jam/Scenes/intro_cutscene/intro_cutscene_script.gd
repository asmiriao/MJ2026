extends Node3D


@export var masks_camera : Camera3D
@export var counter_camera : Camera3D
func _ready() -> void:
	$SimpleTransition/Background.modulate = Color(1,1,1,1)
	$SimpleTransition/AnimationPlayer.play_backwards("fade_in")
	
	AudioManager.load_mostrador_main_loop()
	AudioManager.stream_player.playing = true
	AudioManager.turn_up_volume_from_zero()
	
	pan_trastienda_camera()
	
func pan_trastienda_camera() -> void:
	$CameraPanning.play("transtienda_pan")

func _on_camera_panning_animation_finished(anim_name: StringName) -> void:
	if anim_name == "transtienda_pan":
		# Hide the backroom, show the menu, and pan to the counter
		masks_camera.current = false
		$Trastienda.visible = false
		$Menu.visible = true
		counter_camera.current = true
		$SimpleTransition/AnimationPlayer.play_backwards("fade_in")
		$CameraPanning.play("mostrador_pan")
		
	elif anim_name == "mostrador_pan":
		# The intro is completely finished. 
		$Menu.visible = false
		#Load level
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
