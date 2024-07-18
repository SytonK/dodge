class_name Hazard
extends LifetimeAttack


const A_FACTOR_AT_SETUP: float = 0.4


@export var setup_time: float
@onready var setup_timer: Timer = $SetupTimer

var at_setup: bool = true

@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	setup_timer.wait_time = setup_time

func _process(delta: float) -> void:
	super._process(delta)
	_calc_sprite_a()


func _calc_sprite_a() -> void:
	if at_setup:
		sprite_2d.self_modulate.a = A_FACTOR_AT_SETUP * curr_lifetime / setup_time


func _set_at_setup(new_at_setup: bool) -> void:
	at_setup = new_at_setup
	if !at_setup:
		monitorable = true
		monitoring = true
		sprite_2d.self_modulate.a = 1


func _on_setup_timer_timeout() -> void:
	at_setup = true
	monitorable = true
	monitoring = true
	sprite_2d.self_modulate.a = 1
