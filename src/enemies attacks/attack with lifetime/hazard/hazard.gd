class_name Hazard
extends LifetimeAttack


const A_FACTOR_AT_SETUP: float = 0.4


@export var setup_time: float
@onready var setup_timer: Timer

var at_setup: bool = true

@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	_init_setup_timer()

func _init_setup_timer() -> void:
	setup_timer = Timer.new()
	setup_timer.wait_time = setup_time
	setup_timer.timeout.connect(_on_setup_timer_timeout)
	add_child(setup_timer)
	setup_timer.start()

func _process(delta: float) -> void:
	super._process(delta)

func _physics_process(_delta: float) -> void:
	_calc_sprite_a()


func _calc_sprite_a() -> void:
	if at_setup:
		sprite_2d.self_modulate.a = A_FACTOR_AT_SETUP * curr_lifetime / setup_time


func _on_setup_timer_timeout() -> void:
	at_setup = false
	monitorable = true
	monitoring = true
	sprite_2d.self_modulate.a = 1
