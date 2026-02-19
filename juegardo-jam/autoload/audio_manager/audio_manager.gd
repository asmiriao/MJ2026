extends Node

@export var stream_player : AudioStreamPlayer
@export var resource_preloader : ResourcePreloader

func _ready() -> void:
	stream_player.stream = resource_preloader.get_resource("menu")
	stream_player.playing = true
	pass
