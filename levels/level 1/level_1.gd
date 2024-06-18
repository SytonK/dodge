extends Level


@onready var global_bullet_parallal_direction: GlobalBulletParallalDirection = $GlobalBulletParallalDirection
@onready var global_bullet_target_player: GlobalBulletTargetPlayer = $GlobalBulletTargetPlayer
@onready var parallal_tower: ParallalTower = $ParallalTower


func _ready() -> void:
	super._ready()
	player.position = Vector2(0, 150)


func _to_normal() -> void:
	super._to_normal()
	global_bullet_parallal_direction.frequency = 0.25
	global_bullet_target_player.disabled = false
	parallal_tower.disabled = false

func _to_hard() -> void:
	super._to_hard()
	global_bullet_parallal_direction.frequency = 0.1
	global_bullet_target_player.speed = 700
	parallal_tower.frequency = 0.45
	parallal_tower.speed = 550
