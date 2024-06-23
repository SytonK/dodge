class_name GlobalBulletSpawner
extends Node2D


const BULLET = preload("res://src/enemies attacks/projectiles/bullet/bullet.tscn")

@export var speed: float
@export var frequency: float : set = _set_frequency
@onready var timer: Timer

@export var disabled: bool = false : set = _set_disabled

var bullet_color: Color = Color(1, 0, 0)

func _ready() -> void:
	_init_timer()
	_set_disabled(disabled)

func _init_timer() -> void:
	timer = Timer.new()
	timer.wait_time = frequency
	timer.timeout.connect(_spawn_bullet)
	timer.autostart = true
	add_child(timer)

func _spawn_bullet() -> void: 
	var new_bullet = BULLET.instantiate()
	new_bullet.movment_speed = speed
	new_bullet.position = Screen.get_random_position_on_screen_edge()
	new_bullet.direction = _get_bullet_direction(new_bullet)
	new_bullet.modulate = _get_bullet_color(new_bullet)
	add_child(new_bullet)

func _set_frequency(new_frequency: float) -> void:
	frequency = new_frequency
	if timer && new_frequency > 0:
		timer.wait_time = frequency
		timer.start()

func _get_bullet_direction(new_bullet: Bullet) -> Vector2:
	return PlayerRef.player_ref.position - new_bullet.position

func _get_bullet_color(new_bullet: Bullet) -> Color:
	return Color(bullet_color * ((600 + new_bullet.movment_speed) / 1800), 1)

func _set_disabled(new_disabled: bool) -> void:
	disabled = new_disabled
	if timer:
		if disabled:
			timer.stop()
		else:
			timer.start()
