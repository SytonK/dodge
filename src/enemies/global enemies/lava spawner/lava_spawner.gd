class_name LavaSpawner
extends Node2D


const LAVA_COLOR: Color = Color(0.85, 0.35, 0.15)

@export var lava_polygon: PackedVector2Array
@export var lava_lifetime: float
@export var setup_time: float
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
	var new_lava = Lava.new()
	new_lava.lifetime = lava_lifetime
	new_lava.polygon_packed_vector_array = lava_polygon
	new_lava.polygon_color = LAVA_COLOR
	new_lava.setup_time = setup_time
	new_lava.position = _get_position()
	add_child(new_lava)


func _get_position() -> Vector2:
	return PlayerRef.player_ref.position

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
