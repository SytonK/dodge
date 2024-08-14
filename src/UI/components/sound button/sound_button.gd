class_name SoundButton extends Button


func _init() -> void:
	mouse_entered.connect(UISoundAutoload.ui_sound_play.bind("UIHover"))
	focus_entered.connect(UISoundAutoload.ui_sound_play.bind("UIHover"))
	pressed.connect(UISoundAutoload.ui_sound_play.bind("UIClick"))
