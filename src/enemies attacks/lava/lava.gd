class_name Lava
extends Hitbox


var radius: Vector2


func _init(radius_arg: Vector2) -> void:
	super._init()
	radius = radius_arg
	_init_collision_shape()
	monitorable = false


func _init_collision_shape() -> void:
	var new_collision_shape = CollisionShape2D.new()
	new_collision_shape.shape = _init_shape()
	add_child(new_collision_shape)
	

func _init_shape() -> RectangleShape2D:
	var new_shape = RectangleShape2D.new()
	new_shape.size = radius
	return new_shape
