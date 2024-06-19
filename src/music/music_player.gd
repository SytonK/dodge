class_name MusicPlayer
extends AudioStreamPlayer


const EASY = preload("res://assets/music/easy.wav")
const HARD = preload("res://assets/music/hard.wav")
const NORMAL = preload("res://assets/music/normal.wav")


enum MUSIC_LEVEL {
	EASY,
	NORMAL,
	HARD
}


func _ready() -> void: 
	set_music(MUSIC_LEVEL.EASY)


func set_music(music_level: MUSIC_LEVEL) -> void:
	match music_level:
		MUSIC_LEVEL.EASY:
			stream = EASY
		MUSIC_LEVEL.NORMAL:
			stream = NORMAL
		MUSIC_LEVEL.HARD:
			stream = HARD
	
	play()
