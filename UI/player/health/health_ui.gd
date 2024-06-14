class_name HealthUI
extends Control

@onready var sprite_2d: Sprite2D = $Sprite2D
var max_health: int = 4

func update_health(new_health: int) -> void:
	sprite_2d.frame = clamp (max_health - new_health, 0, max_health)
