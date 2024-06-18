class_name ParallalTower
extends StaticBody2D

const BULLET = preload("res://enemies attacks/projectiles/bullet/bullet.tscn")

const DIRECTIONS: Array[Vector2] = [
	Vector2(1, -2),
	Vector2(2, -1),
	Vector2(2, 1),
	Vector2(1, 2),
	Vector2(-1, 2),
	Vector2(-2, 1),
	Vector2(-2, -1),
	Vector2(-1, -2)
]

@export var disabled: bool = false : set = _set_disabled
@onready var polygon_2d: Polygon2D = $Polygon2D

@export var speed: float
@export var frequency: float
@onready var timer: Timer


func _ready() -> void:
	_init_timer()
	_set_disabled(disabled)


func _set_disabled(new_disabled: bool) -> void:
	disabled = new_disabled
	if polygon_2d:
		polygon_2d.color = Color(0.2, 0.2, 0) if disabled else Color(0.9, 0.9, 0.1)
	if timer:
		if disabled:
			timer.stop()
		else:
			timer.start()


func _init_timer() -> void:
	timer = Timer.new()
	timer.wait_time = frequency
	timer.timeout.connect(_spawn_bullets)
	timer.autostart = true
	add_child(timer)

func _spawn_bullets() -> void:
	for direction in DIRECTIONS:
		_spawn_bullet_with_direction(direction)


func _spawn_bullet_with_direction(direction: Vector2) -> void:
	var new_bullet = BULLET.instantiate()
	new_bullet.movment_speed = speed
	new_bullet.direction = direction
	new_bullet.modulate = Color(
		0.9,
		0.9,
		0.9 - Colors.MODULATE_FACTOR * speed
	)
	add_child(new_bullet)

func _set_frequency(new_frequency: float) -> void:
	frequency = new_frequency
	if timer && new_frequency > 0:
		timer.wait_time = frequency
		timer.start()
