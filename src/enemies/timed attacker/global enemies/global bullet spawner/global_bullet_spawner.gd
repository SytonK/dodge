class_name GlobalBulletSpawner
extends TimedAttacker


const BULLET = preload("res://src/enemies attacks/projectiles/bullet/bullet.tscn")

@export var speed: float

var bullet_color: Color = Color(0.9, 0.1, 0.1)


func _on_timer_timeout() -> void:
	_spawn_bullet()


func _spawn_bullet() -> void: 
	var new_bullet = BULLET.instantiate()
	new_bullet.movment_speed = speed
	new_bullet.position = Screen.get_random_position_on_screen_edge()
	new_bullet.direction = _get_bullet_direction(new_bullet)
	new_bullet.modulate = Colors.get_bullet_color(new_bullet, bullet_color)
	add_child(new_bullet)

func _get_bullet_direction(new_bullet: Bullet) -> Vector2:
	return PlayerRef.player_ref.position - new_bullet.position
