extends VBoxContainer


@onready var unpause_button: Button = $UnpauseButton


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):    
		_toggle_pause()


func _toggle_pause() -> void:
	get_tree().paused = !get_tree().paused
	visible = get_tree().paused
	if get_tree().paused == true:
		unpause_button.grab_focus()


func _on_unpause_button_pressed() -> void:
	_toggle_pause()
