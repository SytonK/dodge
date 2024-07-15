class_name Colors
extends Node

const MODULATE_FACTOR: float = 0.001

const max_speed: float = 1000

static func get_bullet_color(new_bullet: Bullet, bullet_color: Color) -> Color:
	return Color(bullet_color * (0.5 + (new_bullet.movment_speed / max_speed)), 1)
