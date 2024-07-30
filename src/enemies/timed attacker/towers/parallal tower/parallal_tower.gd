class_name ParallalTower
extends TimedAttacker


const BULLET = preload("res://src/enemies attacks/projectiles/bullet/bullet.tscn")

const DISABLED_COLOR: Color = Color(0.25, 0.25, 0.05)
const ACTIVE_COLOR: Color = Color(0.8, 0.8, 0.15)

const DIRECTIONS: Array[Vector2] = [
	Vector2(1, 0),
	Vector2(1, -2),
	Vector2(-1, -2),
	Vector2(-1, 0),
	Vector2(-1, 2),
	Vector2(1, 2),
]

var BULLUT_COLOR: Color = Color(0.9, 0.9, 0)

@onready var assembly_audio_stream_player: AudioStreamPlayer = $AssemblyAudioStreamPlayer

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var speed: float



func _set_disabled(new_disabled: bool) -> void:
	super._set_disabled(new_disabled)
	if sprite_2d:
		sprite_2d.modulate = DISABLED_COLOR if disabled else ACTIVE_COLOR
	if !new_disabled && assembly_audio_stream_player:
		assembly_audio_stream_player.play()

func _on_timer_timeout() -> void:
	_spawn_bullets()

func _spawn_bullets() -> void:
	for direction in DIRECTIONS:
		_spawn_bullet_with_direction(direction)


func _spawn_bullet_with_direction(direction: Vector2) -> void:
	var new_bullet = BULLET.instantiate()
	new_bullet.movment_speed = speed
	new_bullet.direction = direction
	new_bullet.modulate = Colors.get_bullet_color(new_bullet, BULLUT_COLOR)
	add_child(new_bullet)
