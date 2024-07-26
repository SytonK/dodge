extends Control


@onready var audio_menu: Control = $VBoxContainer/AudioMenu
@onready var video_menu: Control = $VBoxContainer/VideoMenu

@onready var curr_settings_menu: Control = audio_menu : set = _set_curr_settings_menu

@onready var audio_button: Button = $VBoxContainer/SettingsSelector/AudioButton


func _ready() -> void:
	if visible:
		audio_button.grab_focus()
	visibility_changed.connect(_on_visibility_change)


func _on_audio_button_pressed() -> void:
	curr_settings_menu = audio_menu


func _on_video_button_pressed() -> void:
	curr_settings_menu = video_menu

func _set_curr_settings_menu(new_menu: Control) -> void:
	curr_settings_menu.visible = false
	curr_settings_menu = new_menu
	curr_settings_menu.visible = true


func _on_visibility_change() -> void:
	if visible:
		audio_button.grab_focus()
