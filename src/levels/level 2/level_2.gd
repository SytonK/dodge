extends Level


@onready var chaser: Chaser = $chaser
@onready var global_bullet_spawner_parallal_direction: GlobalBulletSpawnerParallalDirection = $GlobalBulletSpawnerParallalDirection
@onready var global_bullet_spawner: GlobalBulletSpawner = $GlobalBulletSpawner
@onready var parallal_tower: ParallalTower = $ParallalTower
@onready var target_player_tower_left: TargetPlayerTower = $TargetPlayerTowerLeft
@onready var target_player_tower_right: TargetPlayerTower = $TargetPlayerTowerRight


func _to_normal() -> void:
	super._to_normal()
	chaser.movement_speed = 320
	global_bullet_spawner_parallal_direction.frequency = 0.45
	global_bullet_spawner_parallal_direction.speed = 410
	global_bullet_spawner.frequency = 1
	parallal_tower.disabled = false
	await get_tree().create_timer(0.35).timeout
	target_player_tower_left.disabled = false
	await get_tree().create_timer(0.35).timeout
	target_player_tower_right.disabled = false

func _to_hard() -> void:
	super._to_hard()
	chaser.movement_speed = 400
	chaser.leavse_spike_trail = true
	global_bullet_spawner_parallal_direction.frequency = 0.3
	global_bullet_spawner_parallal_direction.speed = 450
	global_bullet_spawner.frequency = 0.7
	global_bullet_spawner.speed = 600
	parallal_tower.frequency = 0.8
	parallal_tower.speed = 500 
	target_player_tower_left.frequency = 0.25
	target_player_tower_right.speed = 750
	
