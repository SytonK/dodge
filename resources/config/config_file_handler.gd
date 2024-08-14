extends Node


const SETTINGS_FILE_PATH: String = "user://settings.ini"


var config_file: ConfigFile = ConfigFile.new()

var screen_shake: bool


func _ready() -> void:
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		_set_default_audio_settings()
		_set_default_video_settings()
		
		config_file.save(SETTINGS_FILE_PATH)
	else:
		config_file.load(SETTINGS_FILE_PATH)
		
		_check_new_settings()
		_load_audio_settings()
		_load_video_settings()


func _check_new_settings() -> void:
	if !(config_file.has_section_key('audio', 'master_muted') &&
		config_file.has_section_key('audio', 'master_volum') &&
		config_file.has_section_key('audio', 'music_muted') &&
		config_file.has_section_key('audio', 'music_volum') &&
		config_file.has_section_key('audio', 'sfx_muted') &&
		config_file.has_section_key('audio', 'sfx_volum') &&
		config_file.has_section_key('audio', 'ui_muted') &&
		config_file.has_section_key('audio', 'ui_volum')):
		_set_default_audio_settings()
	
	if !config_file.has_section_key('video', 'screen_shake'):
		_set_default_video_settings()


func _set_default_audio_settings() -> void:
	config_file.set_value("audio", "master_muted", false)
	config_file.set_value("audio", "master_volum", 0)
	config_file.set_value("audio", "music_muted", false)
	config_file.set_value("audio", "music_volum", 0)
	config_file.set_value("audio", "sfx_muted", false)
	config_file.set_value("audio", "sfx_volum", 0)
	config_file.set_value("audio", "ui_muted", false)
	config_file.set_value("audio", "ui_volum", 0)

func save_audio_settings(key: String, value):
	config_file.set_value('audio', key, value)
	config_file.save(SETTINGS_FILE_PATH)

func _load_audio_settings() -> void:
	AudioServer.set_bus_mute(0, config_file.get_value('audio', 'master_muted'))
	AudioServer.set_bus_volume_db(0, config_file.get_value('audio', 'master_volum'))
	AudioServer.set_bus_mute(1, config_file.get_value('audio', 'music_muted'))
	AudioServer.set_bus_volume_db(1, config_file.get_value('audio', 'music_volum'))
	AudioServer.set_bus_mute(2, config_file.get_value('audio', 'sfx_muted'))
	AudioServer.set_bus_volume_db(2, config_file.get_value('audio', 'sfx_volum'))
	AudioServer.set_bus_mute(3, config_file.get_value('audio', 'ui_muted'))
	AudioServer.set_bus_volume_db(3, config_file.get_value('audio', 'ui_volum'))


func _set_default_video_settings() -> void:
	config_file.set_value("video", "screen_shake", true)

func save_video_settings(key: String, value):
	config_file.set_value('video', key, value)
	config_file.save(SETTINGS_FILE_PATH)

func _load_video_settings() -> void:
	screen_shake = config_file.get_value('video', 'screen_shake')
