extends Level


@onready var parallal_tower: ParallalTower = $ParallalTower
@onready var global_bullet_spawner_parallal_direction: GlobalBulletSpawnerParallalDirection = $GlobalBulletSpawnerParallalDirection
@onready var global_bullet_spawner: GlobalBulletSpawner = $GlobalBulletSpawner


func _ready() -> void:
	super._ready()
	player.position = Vector2(0, 150)


func _to_normal() -> void:
	super._to_normal()
	global_bullet_spawner_parallal_direction.frequency = 0.2
	global_bullet_spawner.disabled = false
	parallal_tower.disabled = false

func _to_hard() -> void:
	super._to_hard()
	global_bullet_spawner_parallal_direction.frequency = 0.1
	global_bullet_spawner.speed = 700
	parallal_tower.frequency = 0.4
	parallal_tower.speed = 550
