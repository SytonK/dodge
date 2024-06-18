extends Level


@onready var global_bullet_target_player: GlobalBulletTargetPlayer = $GlobalBulletTargetPlayer
@onready var target_player_tower_left: TargetPlayerTower = $TargetPlayerTowerLeft
@onready var target_player_tower_right: TargetPlayerTower = $TargetPlayerTowerRight


func _to_normal() -> void:
	super._to_normal()
	global_bullet_target_player.frequency = 0.35
	target_player_tower_left.disabled = false
	await get_tree().create_timer(0.5).timeout
	target_player_tower_right.disabled = false
