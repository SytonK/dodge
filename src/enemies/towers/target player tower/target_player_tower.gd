class_name TargetPlayerTower
extends StaticBody2D


const BULLET = preload("res://src/enemies attacks/projectiles/bullet/bullet.tscn")

@export var disabled: bool = false : set = _set_disabled
@onready var polygon_2d: Polygon2D = $Polygon2D

@export var speed: float
@export var frequency: float
@onready var timer: Timer

var bullet_color: Color = Color(1, 0, 0)


func _ready() -> void:
	_init_timer()
	_set_disabled(disabled)


func _set_disabled(new_disabled: bool) -> void:
	disabled = new_disabled
	if polygon_2d:
		polygon_2d.color = Color(0.2, 0, 0) if disabled else Color(0.9, 0.1, 0.1)
	if timer:
		if disabled:
			timer.stop()
		else:
			timer.start()


func _init_timer() -> void:
	timer = Timer.new()
	timer.wait_time = frequency
	timer.timeout.connect(_spawn_bullet)
	timer.autostart = true
	add_child(timer)

func _spawn_bullet() -> void:
	var new_bullet = BULLET.instantiate()
	new_bullet.movment_speed = speed
	new_bullet.direction = PlayerRef.player_ref.global_position - global_position
	new_bullet.modulate = _get_bullet_color(new_bullet)
	add_child(new_bullet)

func _get_bullet_color(new_bullet: Bullet) -> Color:
	return Color(bullet_color * ((600 + new_bullet.movment_speed) / 1800), 1)


func _set_frequency(new_frequency: float) -> void:
	frequency = new_frequency
	if timer && new_frequency > 0:
		timer.wait_time = frequency
		timer.start()
