class_name GlobalBulletSpawnerParallalDirection
extends GlobalBulletSpawner


func _init() -> void:
	bullet_color = Color(1, 1, 0)


func _get_bullet_direction(new_bullet: Bullet) -> Vector2:
	return  Screen.get_paralel_direction(new_bullet.position)
