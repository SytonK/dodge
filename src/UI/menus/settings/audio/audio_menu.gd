extends Control


@onready var master_audio_slider : AudioSlider = $VBoxContainer/Master/AudioSlider
@onready var music_audio_slider: AudioSlider = $VBoxContainer/Music/AudioSlider
@onready var SFX_audio_slider: AudioSlider = $VBoxContainer/SFX/AudioSlider
@onready var audio_slider: AudioSlider = $VBoxContainer/UI/AudioSlider


func _on_reset_button_pressed() -> void:
	master_audio_slider.value = 0
	AudioServer.set_bus_volume_db(0, 0)
	ConfigFileHandler.save_audio_settings('master_volum', 0)
	
	music_audio_slider.value = 0
	AudioServer.set_bus_volume_db(1, 0)
	ConfigFileHandler.save_audio_settings('music_volum', 0)
	
	SFX_audio_slider.value = 0
	AudioServer.set_bus_volume_db(2, 0)
	ConfigFileHandler.save_audio_settings('sfx_volum', 0)

	audio_slider.value = 0
	AudioServer.set_bus_volume_db(3, 0)
	ConfigFileHandler.save_audio_settings('ui_volum', 0)
