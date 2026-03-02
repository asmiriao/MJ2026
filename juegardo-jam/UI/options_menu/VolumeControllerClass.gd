class_name VolumeControllerClass extends Node

@export var music_slider : HSlider
@export var sfx_slider : HSlider

@onready var _music_bus_idx = AudioServer.get_bus_index("Music")
@onready var _sfx_bus_idx = AudioServer.get_bus_index("Sfx")

func _ready() -> void:
	init_audio()

func _on_music_slider_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(_music_bus_idx, music_slider.value)
	pass # Replace with function body.

func _on_sfx_slider_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(_sfx_bus_idx, sfx_slider.value)
	pass # Replace with function body.

func init_audio() -> void:
	music_slider.value = -15
	sfx_slider.value = -15
	AudioServer.set_bus_volume_db(_music_bus_idx, music_slider.value)
	AudioServer.set_bus_volume_db(_sfx_bus_idx, sfx_slider.value)
