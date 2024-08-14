class_name UISound extends Node


@onready var sounds = {
	&"UIHover": AudioStreamPlayer.new(),
	&"UIClick": AudioStreamPlayer.new()
}


func _ready() -> void:
	for sound in sounds.keys():
		sounds[sound].stream = load("res://src/UI/UISound/assets/" + str(sound) + ".mp3")
		sounds[sound].bus = &"UI"
		sounds[sound].name = str(sound) + "AudioStreamPlayer"
		add_child(sounds[sound])


func ui_sound_play(sound: String) -> void:
	sounds[sound].play()
