extends Level


@onready var global_bullet_parallal_direction: GlobalBulletParallalDirection = $GlobalBulletParallalDirection
@onready var global_bullet_target_player: GlobalBulletTargetPlayer = $GlobalBulletTargetPlayer


func _to_normal() -> void:
	super._to_normal()
	global_bullet_parallal_direction.frequency = 0.25
	global_bullet_target_player.disabled = false
