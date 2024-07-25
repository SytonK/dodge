extends Control


@onready var game_title: Label = $GameTitle
@onready var main_menu_v_box: VBoxContainer = $MainMenuVBox

@onready var settings_menu: Control = $SettingsMenu


func _on_settings_menu_pressed() -> void:
	game_title.visible = false
	main_menu_v_box.visible = false
	settings_menu.visible = true


func _on_return_button_pressed() -> void:
	game_title.visible = true
	main_menu_v_box.visible = true
	settings_menu.visible = false
