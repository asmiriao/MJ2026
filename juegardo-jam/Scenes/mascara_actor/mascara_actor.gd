extends Sprite3D

@export var base_texture : Texture2D
@export var outline_texture : Texture2D



func _on_mascara_mouse_entered() -> void:
	texture = outline_texture
	pass # Replace with function body.


func _on_mascara_mouse_exited() -> void:
	texture = base_texture
	pass # Replace with function body.
