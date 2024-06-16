extends Level


@onready var global_bullet_target_player: GlobalBulletTargetPlayer = $global_bullet_target_player


func _to_normal() -> void:
	super._to_normal()
	global_bullet_target_player.frequency = 0.4
	global_bullet_target_player.speed *= 1.7
