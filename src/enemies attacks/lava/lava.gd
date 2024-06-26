class_name Lava
extends Fire


@export var setup_time: float
var setup_timer: Timer


func _ready() -> void:
	super._ready()
	_init_setup()
	polygon.color = Color(polygon_color, 0.2)
	monitorable = false
	monitoring = false

func _init_setup() -> void:
	setup_timer = Timer.new()
	setup_timer.wait_time = setup_time
	setup_timer.timeout.connect(_finish_setup)
	setup_timer.autostart = true
	add_child(setup_timer)


func _finish_setup() -> void:
	polygon.color = polygon_color
	monitorable = true
	monitoring = true
