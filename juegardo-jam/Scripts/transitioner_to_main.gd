extends Node

@export var simple_transition : Control
@export var resource_preloader : ResourcePreloader

func _ready() -> void:
	GameManager.connect("transition_volume_down", transition_to_main)

func transition_to_main() -> void:
	# 1. reduce music volume
	# 2. start fade to black and block all input (use the same control node to block)
	# 3. At no music and all black, wait .5s and call the scene_change method to the resource preloaded scene
	
	AudioManager.reduce_volume_to_zero()
	simple_transition.visible = true
	simple_transition.get_node("AnimationPlayer").play("fade_in")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_packed(resource_preloader.get_resource("intro_cutscene"))
	pass
