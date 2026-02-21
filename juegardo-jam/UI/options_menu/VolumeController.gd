class_name VolumeController extends Node

@export var music_slider : HSlider
@export var sfx_slider : HSlider

@onready var _music_bus_idx = AudioServer.get_bus_index("Music")
@onready var _sfx_bus_idx = AudioServer.get_bus_index("Sfx")

func _on_music_slider_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(_music_bus_idx, music_slider.value)
	pass # Replace with function body.

func _on_sfx_slider_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(_sfx_bus_idx, sfx_slider.value)
	pass # Replace with function body.
