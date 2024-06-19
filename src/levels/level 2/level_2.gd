extends Level


@onready var chaser: Chaser = $chaser
@onready var global_bullet_parallal_direction: GlobalBulletParallalDirection = $GlobalBulletParallalDirection
@onready var global_bullet_target_player: GlobalBulletTargetPlayer = $GlobalBulletTargetPlayer
@onready var parallal_tower: ParallalTower = $ParallalTower
@onready var target_player_tower_left: TargetPlayerTower = $TargetPlayerTowerLeft
@onready var target_player_tower_right: TargetPlayerTower = $TargetPlayerTowerRight


func _ready() -> void:
	super._ready()
	player.position = Vector2(0, 150)


func _to_normal() -> void:
	super._to_normal()
	chaser.movement_speed = 300
	global_bullet_parallal_direction.frequency = 0.4
	global_bullet_parallal_direction.speed = 400
	global_bullet_target_player.frequency = 1
	parallal_tower.disabled = false
	target_player_tower_left.disabled = false
	target_player_tower_right.disabled = false

func _to_hard() -> void:
	super._to_hard()
	chaser.movement_speed = 440
	global_bullet_parallal_direction.frequency = 0.25
	global_bullet_parallal_direction.speed = 450
	global_bullet_target_player.frequency = 0.5
	global_bullet_target_player.speed = 650
	parallal_tower.frequency = 0.7
	parallal_tower.speed = 500 
	target_player_tower_left.frequency = 0.25
	target_player_tower_right.speed = 750
	
