class_name MenuController extends Node

@export var options_menu : Control
@export var main_menu_ui : HBoxContainer


func _on_options_button_pressed() -> void:
	options_menu.visible = true
	pass # Replace with function body.


func _on_close_button_pressed() -> void:
	options_menu.visible = false
	pass # Replace with function body.

func hide_main_menu() -> void:
	main_menu_ui.get_node("AnimationPlayer").play("hide")
	pass
