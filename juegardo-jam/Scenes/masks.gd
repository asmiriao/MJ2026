extends Node3D


@export var camera : Camera3D

#func _ready() -> void:
	# sync_mask_visibility()

#func sync_mask_visibility() -> void:
#	for i in range(mask_nodes.size()):
#		if GameManager.chosen_masks[i] == 1:
#			mask_nodes[i].visible = false
	
func choose_mask(mask_node : Node, index : int) -> void:
	mask_node.visible = false
	mask_node.get_child(0).visible = false
	GameManager.confirm_mask_choice(index)

func _on_button_payaso_pressed():
	choose_mask($Payaso, 0)
func _on_button_maori_pressed():
	choose_mask($Maori, 1)
func _on_button_saturnia_pressed():
	choose_mask($Saturnia, 2)
func _on_button_moretta_pressed():
	choose_mask($Moretta, 3)
func _on_button_namanari_pressed():
	choose_mask($Namanari, 4)
func _on_button_carnaval_pressed():
	choose_mask($Carnaval, 5)
func _on_button_peste_pressed():
	choose_mask($Peste, 6)
func _on_button_victoriana_pressed():
	choose_mask($Victoriana, 7)
func _on_button_blanca_pressed():
	choose_mask($Blanca, 8)
