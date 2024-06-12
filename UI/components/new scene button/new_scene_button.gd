class_name ChangeSceneButton
extends Button


@export var file_path: String


func _init() -> void:
	pressed.connect(_change_scene)


func _change_scene() -> void:
	get_tree().change_scene_to_file(file_path)
