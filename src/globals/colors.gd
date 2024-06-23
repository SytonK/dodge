class_name Colors
extends Node

const MODULATE_FACTOR: float = 0.001


static func get_bullet_color(new_bullet: Bullet, bullet_color: Color) -> Color:
	return Color(bullet_color * ((600 + new_bullet.movment_speed) / 1800), 1)
