class_name Trail
extends Line2D


@export var max_length: int
var queue : Array

 
func _process(_delta: float) -> void:
	_update_points()

func _update_points() -> void:
	var pos = _get_position()
	
	queue.push_front(pos)
	
	if  queue.size() > max_length:
		queue.pop_back()
	
	clear_points()
	
	for point in queue:
		add_point(point)

func _get_position() -> Vector2:
	return owner.position
