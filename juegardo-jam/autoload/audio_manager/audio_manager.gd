extends Node

@export var stream_player : AudioStreamPlayer
@export var resource_preloader : ResourcePreloader

func _ready() -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), -15)
	stream_player.stream = resource_preloader.get_resource("menu")
	stream_player.playing = false
	pass

func reduce_volume_to_zero() -> void:
	var tween = create_tween()
	tween.tween_property(stream_player, "volume_db", -40, 3.0)
	
func turn_up_volume_from_zero() -> void:
	var tween = create_tween()
	tween.tween_property(stream_player, "volume_db", 0, 1)

func load_mostrador_main_loop() -> void:
	stream_player.stream = resource_preloader.get_resource("mostrador_main_loop")
	
	
