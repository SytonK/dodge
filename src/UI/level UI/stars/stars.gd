class_name Stars
extends HBoxContainer


const FULL_STAR = preload("res://assets/UI/stars/full_star.png")

@onready var stars: Array[TextureRect] = [$Star0, $Star1, $Star2]

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func add_star(star_index: int) -> void:
	stars[star_index].texture = FULL_STAR
	stars[star_index].self_modulate = Color(1,1,1)
	audio_stream_player.play()
