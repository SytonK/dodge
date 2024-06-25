class_name LavaSpawnerRandomPosition
extends LavaSpawner



func _get_position() -> Vector2:
	return Screen.get_random_position()
