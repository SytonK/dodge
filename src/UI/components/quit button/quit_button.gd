class_name QuitButton
extends Button


func _init() -> void:
	pressed.connect(_quit)

func _quit() -> void:
	get_tree().quit()
