class_name Hazard
extends LifetimeAttack

const A_FACTOR_AT_SETUP: float = 0.4

@export var setup_time: float
@onready var sprite_2d: Sprite2D = $Sprite2D


func _process(delta: float) -> void:
	super._process(delta)
	sprite_2d.self_modulate.a = ((A_FACTOR_AT_SETUP * curr_lifetime) / setup_time) if curr_lifetime < setup_time else 1.0
