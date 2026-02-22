extends Node3D

@export var transtienda_camera : Camera3D
@export var mostrador_camera : Camera3D

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
		transtienda_camera.current = false
		$Trastienda.visible = false
		$Menu.visible = true
		mostrador_camera.current = true
		$SimpleTransition/AnimationPlayer.play_backwards("fade_in")
		$CameraPanning.play("mostrador_pan")
	else:
		#load level
		pass
	pass # Replace with function body.
