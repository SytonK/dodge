extends VBoxContainer


@onready var main_menu_button: ChangeSceneButton = $MainMenuButton


func _ready() -> void:
	visibility_changed.connect(_main_menu_button_grab_focus)


func _main_menu_button_grab_focus() -> void:
	main_menu_button.grab_focus()
