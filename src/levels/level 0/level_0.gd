extends Level

@onready var global_bullet_spawner: GlobalBulletSpawner = $GlobalBulletSpawner
@onready var target_player_tower_left: TargetPlayerTower = $TargetPlayerTowerLeft
@onready var target_player_tower_right: TargetPlayerTower = $TargetPlayerTowerRight
@onready var fast_global_bullet_spawner: GlobalBulletSpawner = $FastGlobalBulletSpawner


func _to_normal() -> void:
	super._to_normal()
	global_bullet_spawner.frequency = 0.35
	target_player_tower_left.disabled = false
	await get_tree().create_timer(0.5).timeout
	target_player_tower_right.disabled = false

func _to_hard() -> void:
	super._to_hard()
	target_player_tower_left.speed = 650
	target_player_tower_right.speed = 650
	global_bullet_spawner.frequency = 0.3
	fast_global_bullet_spawner.disabled = false
