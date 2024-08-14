class_name QuitButton
extends SoundButton


func _init() -> void:
	super._init()
	pressed.connect(_quit)

func _quit() -> void:
	get_tree().quit()
