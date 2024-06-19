class_name Screen


const X: float = 1920
const Y: float = 1080

const X_SIZE: float = X/2 + 64 
const Y_SIZE: float = Y/2 + 64

enum SIDE { left, right, top, bottom }


static func get_random_position_on_screen_edge() -> Vector2:
	var side_index: SIDE = randi_range(0, 3) as SIDE
	
	match side_index:
		SIDE.left:
			return Vector2(-X_SIZE, randf_range(-Y_SIZE, Y_SIZE))
		SIDE.right:
			return Vector2(X_SIZE, randf_range(-Y_SIZE, Y_SIZE))
		SIDE.top:
			return Vector2(randf_range(-X_SIZE, X_SIZE), -Y_SIZE)
		SIDE.bottom:
			return Vector2(randf_range(-X_SIZE, X_SIZE), Y_SIZE)
	
	return Vector2.ZERO

static func get_paralel_direction(position: Vector2) -> Vector2:
	if abs(position.x) == X_SIZE:
		return Vector2(-position.x, 0)
	else:
		return Vector2(0,-position.y)
