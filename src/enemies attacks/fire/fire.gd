class_name Fire
extends Hitbox


@export var lifetime: float
var curr_lifetime: float = 0

@export var polygon_packed_vector_array: PackedVector2Array
@export var polygon_color: Color

var polygon: Polygon2D

func _ready() -> void:
	_init_collision_polygon()
	_init_polygon()

func _process(delta: float) -> void:
	curr_lifetime += delta
	if curr_lifetime > lifetime:
		queue_free()


func _init_collision_polygon() -> void:
	var new_collision_polygon = CollisionPolygon2D.new()
	new_collision_polygon.polygon = polygon_packed_vector_array
	add_child(new_collision_polygon)

func _init_polygon() -> void:
	polygon = Polygon2D.new()
	polygon.polygon = polygon_packed_vector_array
	polygon.color = polygon_color
	add_child(polygon)
