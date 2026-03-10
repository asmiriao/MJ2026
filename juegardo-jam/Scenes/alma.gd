extends CharacterBody3D

var dialogues : Array[String] = [
	"dialogoAlma1", "dialogoAlma2", "dialogoAlma3",
	"dialogoAlma4", "dialogoAlma5", "dialogoAlma6",
	"dialogoAlma7", "dialogoAlma8", "dialogoAlma9",
]

@onready var anim_player = $AnimationPlayer

func play_disappear_anim() -> void:
	anim_player.play("desaparecer")
	
func delete_soul():
	queue_free()
	
	
