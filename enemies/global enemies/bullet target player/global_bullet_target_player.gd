extends Node2D

@export var speed: float
@export var frequency: float
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
	print('fire')
