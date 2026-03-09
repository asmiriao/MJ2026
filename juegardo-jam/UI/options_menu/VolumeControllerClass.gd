class_name VolumeControllerClass extends Node

@export var music_slider : HSlider
@export var sfx_slider : HSlider

@onready var _music_bus_idx = AudioServer.get_bus_index("Music")
@onready var _sfx_bus_idx = AudioServer.get_bus_index("Sfx")

func _ready() -> void:
	init_audio()

func _on_music_slider_value_changed(value : float) -> void:
	# Convert audio to a logarithmic scale (That's how volume works)
	AudioServer.set_bus_volume_db(_music_bus_idx, linear_to_db(value))

func _on_sfx_slider_value_changed(value : float) -> void:
	# Convert audio to a logarithmic scale (That's how volume works)
	AudioServer.set_bus_volume_db(_sfx_bus_idx, linear_to_db(value))

func init_audio() -> void:
	# Get current volume of bus and set it to the slider (convert from log to linear scale)
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(_music_bus_idx))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(_sfx_bus_idx))
