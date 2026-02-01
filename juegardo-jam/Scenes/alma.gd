extends CharacterBody3D

var dialogos = [
	"dialogoAlma1",
	"dialogoAlma2",
	"dialogoAlma3",
	"dialogoAlma4",
	"dialogoAlma5",
	"dialogoAlma6",
	"dialogoAlma7",
	"dialogoAlma8",
	"dialogoAlma9",
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func desaparecer():
	$AnimationPlayer.play("desaparecer")
	
func eliminar():
	GameManager.cargar_mascaras()
	
	
