class_name Spike
extends LifetimeAttack


func _on_hit() -> void:
	queue_free()
