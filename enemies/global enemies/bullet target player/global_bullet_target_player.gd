class_name GlobalBulletTargetPlayer
extends Node2D


const BULLET = preload("res://enemies attacks/projectiles/bullet/bullet.tscn")

@export var speed: float
@export var frequency: float = 0 : set = _set_frequency
@onready var timer: Timer


func _ready() -> void:
	_init_timer()

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
	new_bullet.direction = PlayerRef.player_ref.position - new_bullet.position
	new_bullet.modulate = Color(
		0.9,
		0.9 - Colors.MODULATE_FACTOR * speed,
		0.9 - Colors.MODULATE_FACTOR * speed
	)
	add_child(new_bullet)

func _set_frequency(new_frequency: float) -> void:
	frequency = new_frequency
	if timer && new_frequency > 0:
		timer.wait_time = frequency
		timer.start()
