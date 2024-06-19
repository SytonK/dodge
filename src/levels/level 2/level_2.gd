extends Level


@onready var chaser: Chaser = $chaser
@onready var global_bullet_parallal_direction: GlobalBulletParallalDirection = $GlobalBulletParallalDirection
@onready var global_bullet_target_player: GlobalBulletTargetPlayer = $GlobalBulletTargetPlayer


func _to_normal() -> void:
	super._to_normal()
	chaser.movement_speed = 300
	global_bullet_parallal_direction.frequency = 0.4
	global_bullet_parallal_direction.speed = 400
	global_bullet_target_player.frequency = 1
	
