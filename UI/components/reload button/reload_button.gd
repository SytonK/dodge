class_name ReloadButton
extends Button


func _init() -> void:
	pressed.connect(_reload)

func _reload() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
