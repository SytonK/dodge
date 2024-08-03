extends Level


@onready var global_bullet_spawner: GlobalBulletSpawner = $GlobalBulletSpawner
@onready var global_bullet_spawner_parallal_direction: GlobalBulletSpawnerParallalDirection = $GlobalBulletSpawnerParallalDirection
@onready var parallal_tower: ParallalTower = $ParallalTower
@onready var target_player_tower_top_rigth: TargetPlayerTower = $TargetPlayerTowerTopRigth
@onready var target_player_tower_bottom_rigth: TargetPlayerTower = $TargetPlayerTowerBottomRigth
@onready var target_player_tower_bottom_left: TargetPlayerTower = $TargetPlayerTowerBottomLeft
@onready var target_player_tower_top_left: TargetPlayerTower = $TargetPlayerTowerTopLeft


func _ready() -> void:
	super._ready()
	player.position = Vector2(0, 150)

func _to_normal() -> void: 
	super._to_normal()
	global_bullet_spawner.speed = 700
	global_bullet_spawner_parallal_direction.frequency = .4
	parallal_tower.frequency = 1
	target_player_tower_top_rigth.disabled = false
	await get_tree().create_timer(.8).timeout
	target_player_tower_bottom_rigth.disabled = false
	await get_tree().create_timer(.8).timeout
	target_player_tower_bottom_left.disabled = false
	await get_tree().create_timer(.8).timeout
	target_player_tower_top_left.disabled = false
	
