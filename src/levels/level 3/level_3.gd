extends Level


@onready var lava_spawner: LavaSpawner = $LavaSpawner
@onready var global_bullet_spawner: GlobalBulletSpawner = $GlobalBulletSpawner
@onready var global_bullet_spawner_parallal_direction: GlobalBulletSpawnerParallalDirection = $GlobalBulletSpawnerParallalDirection


func _to_normal() -> void:
	super._to_normal()
	lava_spawner.frequency = 0.75
	lava_spawner.lava_lifetime = 6
	global_bullet_spawner.frequency = 0.2
	global_bullet_spawner_parallal_direction.speed = 725
