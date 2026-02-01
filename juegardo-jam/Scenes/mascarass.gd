extends Node3D

func _ready():
	
	cargar_mascaras()

func cargar_mascaras():
	var mascaras = GameManager.mascaras_elegidas
	if (mascaras[0] == 1):
		$Payaso.visible = false
	if (mascaras[1] == 1):
		$Maori.visible = false
	if (mascaras[2] == 1):
		$Saturnia.visible = false
	if (mascaras[3] == 1):
		$Moretta.visible = false
	if (mascaras[4] == 1):
		$Namanari.visible = false
	if (mascaras[5] == 1):
		$Carnaval.visible = false
	if (mascaras[6] == 1):
		$Peste.visible = false
	if (mascaras[7] == 1):
		$Victoriana.visible = false
	if (mascaras[8] == 1):
		$Blanca.visible = false
	
	
func elegir_mascara(masc: Node, num: int):
	masc.visible = false
	masc.get_child(0).visible = false
	GameManager.mascaras_elegidas[num] = 1
	GameManager.alma_actual = GameManager.alma_actual + 1
	GameManager.activado = false
	GameManager.cargar_main()

func _on_button_payaso_pressed():
	elegir_mascara($Payaso, 0)
func _on_button_maori_pressed():
	elegir_mascara($Maori, 1)
func _on_button_saturnia_pressed():
	elegir_mascara($Saturnia, 2)
func _on_button_moretta_pressed():
	elegir_mascara($Moretta, 3)
func _on_button_namanari_pressed():
	elegir_mascara($Namanari, 4)
func _on_button_carnaval_pressed():
	elegir_mascara($Carnaval, 5)
func _on_button_peste_pressed():
	elegir_mascara($Peste, 6)
func _on_button_victoriana_pressed():
	elegir_mascara($Victoriana, 7)
func _on_button_blanca_pressed():
	elegir_mascara($Blanca, 8)
