class_name bullet
extends Hitbox


@export var movment_speed: float
@export var direction: Vector2 : set = _set_direction


func _physics_process(delta: float) -> void:
	position += direction * movment_speed * delta
	_queue_free_out_of_sceen()

func _set_direction(new_direction: Vector2) -> void:
	if new_direction != Vector2.ZERO:
		direction = new_direction.normalized()
		rotation = direction.angle()

func _on_hit() -> void:
	queue_free()


func _queue_free_out_of_sceen() -> void:
	print(DisplayServer.window_get_size())
	if abs(global_position.x) > SceenSize.X || abs(global_position.y) > SceenSize.Y:
		queue_free()
