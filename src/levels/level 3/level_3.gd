extends Level


@onready var global_hazard_spawner: GlobalHazardSpawner = $GlobalHazardSpawner
@onready var global_random_position_hazard_spawner: GlobalRandomPositionHazardSpawner = $GlobalRandomPositionHazardSpawner
@onready var global_bullet_spawner: GlobalBulletSpawner = $GlobalBulletSpawner
@onready var fast_global_bullet_spawner: GlobalBulletSpawner = $FastGlobalBulletSpawner
@onready var global_bullet_spawner_parallal_direction: GlobalBulletSpawnerParallalDirection = $GlobalBulletSpawnerParallalDirection


func _to_normal() -> void: 
	super._to_normal()
	global_hazard_spawner.hazard_scale = Vector2(1.25, 1.25)
	global_random_position_hazard_spawner.disabled = false
	global_bullet_spawner.frequency = 0.4
	fast_global_bullet_spawner.disabled = false
	global_bullet_spawner_parallal_direction.frequency = 0.3

func _to_hard() -> void:
	super._to_hard()

