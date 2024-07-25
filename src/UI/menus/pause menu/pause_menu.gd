extends Control


@onready var unpause_button: Button = $PauseMenuVBox/UnpauseButton
@onready var pause_menu_v_box: VBoxContainer = $PauseMenuVBox
@onready var settings_menu: Control = $SettingsMenu


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):    
		_toggle_pause()


func _toggle_pause() -> void:
	get_tree().paused = !get_tree().paused
	visible = get_tree().paused
	if get_tree().paused == true:
		unpause_button.grab_focus()
		pause_menu_v_box.visible = true
		settings_menu.visible = false
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
	else:
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)


func _on_unpause_button_pressed() -> void:
	_toggle_pause()


func _on_settings_button_pressed() -> void:
	pause_menu_v_box.visible = false
	settings_menu.visible = true


func _on_return_button_pressed() -> void:
	pause_menu_v_box.visible = true
	settings_menu.visible = false
