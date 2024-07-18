extends Level


@onready var global_bullet_spawner: GlobalBulletSpawner = $GlobalBulletSpawner
@onready var global_bullet_spawner_parallal_direction: GlobalBulletSpawnerParallalDirection = $GlobalBulletSpawnerParallalDirection


func _to_normal() -> void:
	super._to_normal()

	global_bullet_spawner.frequency = 0.2
	global_bullet_spawner_parallal_direction.speed = 725
	

func _to_hard() -> void:
	super._to_hard()
	global_bullet_spawner.frequency = 0.1
	global_bullet_spawner.speed = 325
	global_bullet_spawner_parallal_direction.speed = 850
	global_bullet_spawner_parallal_direction.frequency = 0.3
