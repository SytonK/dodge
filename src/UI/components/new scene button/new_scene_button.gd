class_name ChangeSceneButton
extends SoundButton


@export var file_path: String


func _init() -> void:
	super._init()
	pressed.connect(_change_scene)


func _change_scene() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file(file_path)
