extends VBoxContainer


const BUTTON_TEXT: String = 'level '

const LEVEL_PATH0: String = 'res://src/levels/level '
const LEVEL_PATH1: String = '/level_'
const LEVEL_PATH2: String = '.tscn'

const MAX_LEVEL: int = 2

var level: int = 0: set = _set_level
@onready var change_scene_button: ChangeSceneButton = $HBoxContainer/ChangeSceneButton


func _set_level(new_level: int) -> void:
	level = clamp(new_level, 0, MAX_LEVEL)
	if change_scene_button:
		change_scene_button.text = BUTTON_TEXT + str(level)
		change_scene_button.file_path = LEVEL_PATH0 + str(level) + LEVEL_PATH1 + str(level) + LEVEL_PATH2


func _on_button_left_pressed() -> void:
	level -= 1

func _on_button_right_pressed() -> void:
	level += 1
