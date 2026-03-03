extends Node

var array_almas = []
var array_mascaras_seleccionadas : Array[String] = []
var num_alma_turno = 0
var num_alma_global = 0
var alma_actual

func _ready():
	array_almas = $"../almas".get_children()
	alma_actual = array_almas[0]
	atender_cliente()

func atender_cliente():
	print("llega cliente: " + alma_actual.mask_owned)
	print("animacion, conversacion, etc.")
	alma_actual.entrar_tienda()

func cliente_atendido():
	alma_actual.salir_tienda()
	next_alma()
	
func next_alma():
	if num_alma_turno < 2:
		num_alma_turno +=1
		siguiente_num_alma()
	else:
		fin_turno()
		return
	atender_cliente()

func fin_turno():
	alma_actual.salir_tienda()
	print("fin del turno")
	array_mascaras_seleccionadas = []
	num_alma_turno = 0

func siguiente_num_alma():
	for alma in array_almas:
		if not (alma.atendida || array_mascaras_seleccionadas.has(alma.mask_owned)):
			alma_actual = alma
			return
		
	
	
	
