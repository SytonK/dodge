extends Level


@onready var lava_spawner: LavaSpawner = $LavaSpawner
@onready var lava_spawner_random_position: LavaSpawnerRandomPosition = $LavaSpawnerRandomPosition
@onready var global_bullet_spawner: GlobalBulletSpawner = $GlobalBulletSpawner
@onready var global_bullet_spawner_parallal_direction: GlobalBulletSpawnerParallalDirection = $GlobalBulletSpawnerParallalDirection


func _to_normal() -> void:
	super._to_normal()
	lava_spawner.frequency = 0.75
	lava_spawner.lava_lifetime = 6
	lava_spawner.lava_polygon = [Vector2(40,40), Vector2(40,-40), Vector2(-40,-40), Vector2(-40,40)]
	lava_spawner_random_position.disabled = false
	global_bullet_spawner.frequency = 0.2
	global_bullet_spawner_parallal_direction.speed = 725
	

func _to_hard() -> void:
	super._to_hard()
	lava_spawner.frequency = 0.35
	lava_spawner_random_position.lava_polygon = [Vector2(0,30), Vector2(20,20), Vector2(30,0), Vector2(20,-20)
		,Vector2(0,-30), Vector2(-20,-20), Vector2(-30,0), Vector2(-20,20)]
	lava_spawner_random_position.frequency = 0.5
	global_bullet_spawner.frequency = 0.1
	global_bullet_spawner.speed = 325
	global_bullet_spawner_parallal_direction.speed = 850
	global_bullet_spawner_parallal_direction.frequency = 0.3
