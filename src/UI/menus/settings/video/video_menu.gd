extends Control


@onready var screen_shake_button: TextureButton = $ScreenShake/ScreenShakeButton


func _ready() -> void:
	screen_shake_button.button_pressed = ConfigFileHandler.screen_shake


func _on_screen_shake_button_pressed() -> void:
	ConfigFileHandler.screen_shake = screen_shake_button.button_pressed
	ConfigFileHandler.save_video_settings('screen_shake', screen_shake_button.button_pressed)
