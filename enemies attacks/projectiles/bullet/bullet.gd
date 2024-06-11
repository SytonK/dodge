class_name bullet
extends Hitbox


@export var movment_speed: float
@export var directoin: Vector2


func _physics_process(delta: float) -> void:
	position += directoin * movment_speed * delta


func _on_hit() -> void:
	queue_free()
