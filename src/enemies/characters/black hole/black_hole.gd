class_name BlackHole
extends Hitbox


const rotation_speed_1: float = 1
const rotation_speed_2: float = -.8
const rotation_speed_4: float = 0.4


@onready var black_hole_0: Sprite2D = $BlackHole0
@onready var black_hole_1: Sprite2D = $BlackHole1
@onready var black_hole_2: Sprite2D = $BlackHole2
@onready var black_hole_3: Sprite2D = $BlackHole3
@onready var black_hole_4: Sprite2D = $BlackHole4


func _process(delta: float) -> void:
	black_hole_1.rotation += rotation_speed_1 * delta
	black_hole_2.rotation += rotation_speed_2 * delta
	black_hole_3.rotation += rotation_speed_2 * delta
	black_hole_4.rotation += rotation_speed_4 * delta
