class_name ReloadButton
extends SoundButton


func _init() -> void:
	super._init()
	pressed.connect(_reload)

func _reload() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
