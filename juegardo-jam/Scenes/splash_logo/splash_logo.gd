extends Control

@export var animation_player : AnimationPlayer


func _on_dissolve_anim_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	pass # Replace with function body.
