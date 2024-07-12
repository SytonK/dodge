class_name AudioSlider
extends HSlider

@export var bus_name: String

@onready var audio_bus: int = AudioServer.get_bus_index(bus_name)


func _ready() -> void:
	value = AudioServer.get_bus_volume_db(audio_bus)
	drag_ended.connect(_on_drag_ended)


func _on_drag_ended(_value_changed: bool) -> void:
	AudioServer.set_bus_volume_db(audio_bus, value)
	ConfigFileHandler.save_audio_settings(bus_name.to_lower() + '_volum', value)
