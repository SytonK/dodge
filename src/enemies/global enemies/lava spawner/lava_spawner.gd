class_name LavaSpawner
extends Node2D


@export var radius: Vector2
@export var frequency: float : set = _set_frequency
@onready var timer: Timer

@export var disabled: bool = false : set = _set_disabled


func _ready() -> void:
	_init_timer()
	_set_disabled(disabled)

func _init_timer() -> void:
	timer = Timer.new()
	timer.wait_time = frequency
	timer.timeout.connect(_spawn_lava)
	timer.autostart = true
	add_child(timer)

func _spawn_lava() -> void:
	add_child(Lava.new(Vector2(radius)))


func _set_frequency(new_frequency: float) -> void:
	frequency = new_frequency
	if timer && new_frequency > 0:
		timer.wait_time = frequency
		timer.start()

func _set_disabled(new_disabled: bool) -> void:
	disabled = new_disabled
	if timer:
		if disabled:
			timer.stop()
		else:
			timer.start()
