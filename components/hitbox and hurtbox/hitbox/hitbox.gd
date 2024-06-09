class_name Hitbox
extends Area2D


signal hit()


func _init() -> void:
	collision_layer = Layers.HITBOX_LAYER
	collision_mask = 0
 
func on_hit() -> void:
	hit.emit()
