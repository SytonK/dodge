extends Level


@onready var bounce: Bounce = $Bounce
@onready var global_bullet_spawner: GlobalBulletSpawner = $GlobalBulletSpawner
@onready var global_bullet_spawner_parallal_direction: GlobalBulletSpawnerParallalDirection = $GlobalBulletSpawnerParallalDirection
@onready var global_hazard_spawner: GlobalHazardSpawner = $GlobalHazardSpawner
@onready var global_random_position_hazard_spawner: GlobalRandomPositionHazardSpawner = $GlobalRandomPositionHazardSpawner
@onready var parallal_tower: ParallalTower = $ParallalTower
@onready var target_player_tower_left: TargetPlayerTower = $TargetPlayerTowerLeft
@onready var target_player_tower_rigth: TargetPlayerTower = $TargetPlayerTowerRigth


func _ready() -> void:
	super._ready()
	player.position = Vector2(0, 150)


func _to_normal() -> void: 
	super._to_normal()
	bounce.speed = 550
	global_bullet_spawner.speed = 600
	global_bullet_spawner_parallal_direction.frequency = 0.25
	global_hazard_spawner.disabled = false
	global_random_position_hazard_spawner.frequency = 1.05
	parallal_tower.disabled = false
	target_player_tower_left.disabled = false
	target_player_tower_rigth.disabled = false


func _to_hard() -> void:
	super._to_hard()
	bounce.speed = 625
	bounce.explode_on_collision = true
	
	global_bullet_spawner.speed = 650
	global_bullet_spawner.frequency = 1
	
	global_bullet_spawner_parallal_direction.speed = 350
	global_bullet_spawner_parallal_direction.frequency = 2.25
	
	global_hazard_spawner.hazard_scale = Vector2(.5, .5)
	global_hazard_spawner.frequency = 1
	
	global_random_position_hazard_spawner.hazard_scale = Vector2(.625, .625)
	global_random_position_hazard_spawner.frequency = .9
	
	parallal_tower.frequency = 1.6
	
	target_player_tower_left.speed = 800
	
	target_player_tower_rigth.frequency = .6
