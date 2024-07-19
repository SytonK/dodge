class_name GlobalHazardSpawner
extends Node2D


const HAZARD = preload("res://src/enemies attacks/attack with lifetime/hazard/hazard.tscn")


@export var frequency: float
var timer: Timer
@export var lifetime: float
@export var setup_time: float

@export var hazard_scale: Vector2 = Vector2(1,1)


func _ready() -> void:
	_init_timer()


func _init_timer() -> void:
	timer = Timer.new()
	timer.wait_time = frequency
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer )
	timer.start()


func _on_timer_timeout() -> void:
	var new_hazard: Hazard = HAZARD.instantiate()
	new_hazard.lifetime = lifetime
	new_hazard.setup_time = setup_time
	new_hazard.position = _get_new_hazard_position()
	new_hazard.scale = Vector2(hazard_scale)
	add_child(new_hazard)

func _get_new_hazard_position() -> Vector2:
	return PlayerRef.player_ref.position
