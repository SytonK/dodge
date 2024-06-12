extends Node2D


const BULLET = preload("res://enemies attacks/projectiles/bullet/bullet.tscn")

@export var speed: float
@export var frequency: float
@onready var timer: Timer

@export var player_ref: Player

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
	new_bullet.direction = player_ref.position - new_bullet.position
	add_child(new_bullet)
