class_name TargetPlayerTower
extends StaticBody2D


const BULLET = preload("res://src/enemies attacks/projectiles/bullet/bullet.tscn")

const DISABLED_COLOR: Color = Color(0.3, 0.05, 0.05)
const ACTIVE_COLOR: Color = Color(0.8, 0.15, 0.15)


@export var disabled: bool = false : set = _set_disabled
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var speed: float
@export var frequency: float
@onready var timer: Timer

var bullet_color: Color = Color(0.9, 0, 0)


func _ready() -> void:
	_init_timer()
	_set_disabled(disabled)


func _set_disabled(new_disabled: bool) -> void:
	disabled = new_disabled
	if sprite_2d:
		sprite_2d.modulate = DISABLED_COLOR if disabled else ACTIVE_COLOR
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
	new_bullet.modulate = Colors.get_bullet_color(new_bullet, bullet_color)
	add_child(new_bullet)


func _set_frequency(new_frequency: float) -> void:
	frequency = new_frequency
	if timer && new_frequency > 0:
		timer.wait_time = frequency
		timer.start()
