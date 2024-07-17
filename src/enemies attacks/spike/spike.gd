class_name Spike
extends Hitbox


@export var lifetime: float
var curr_lifetime: float = 0


func _process(delta: float) -> void:
	curr_lifetime += delta
	if curr_lifetime > lifetime:
		queue_free()


