class_name GlobalBulletSpawnerParallalDirection
extends GlobalBulletSpawner


func _init() -> void:
	bullet_color = Color(0.9, 0.9, 0.1)


func _get_bullet_direction(new_bullet: Bullet) -> Vector2:
	return  Screen.get_paralel_direction(new_bullet.position)
