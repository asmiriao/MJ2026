extends Node

@export var stream_player : AudioStreamPlayer
@export var resource_preloader : ResourcePreloader

func _ready() -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), -15)
	stream_player.stream = resource_preloader.get_resource("menu")
	stream_player.playing = false
	pass
