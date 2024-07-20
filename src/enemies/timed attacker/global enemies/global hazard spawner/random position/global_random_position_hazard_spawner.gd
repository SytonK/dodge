class_name GlobalRandomPositionHazardSpawner
extends GlobalHazardSpawner


func _get_new_hazard_position() -> Vector2:
	return Screen.get_random_position()
