class_name Worp
extends Area2D


const WORP_STRENGTH: float = 2.5

var bullets: Array[Bullet]


func _ready() -> void:
	area_entered.connect(_on_bullet_entered)
	area_exited.connect(_on_bullet_exiced)
	collision_layer = 0
	collision_mask = Layers.HITBOX_LAYER

func _physics_process(delta: float) -> void:
	for bullet in bullets:
		if is_instance_valid(bullet):
			_add_to_direction(bullet, delta)
		else:
			bullets.erase(bullet)


func _on_bullet_entered(bullet: Bullet) -> void:
	bullets.append(bullet)

func _on_bullet_exiced(bullet: Bullet) -> void:
	bullets.erase(bullet)

func _add_to_direction(bullet: Bullet, delta: float) -> void:
	var direction_to_add: Vector2 = (position - bullet.global_position).normalized() * WORP_STRENGTH * delta
	bullet.direction += direction_to_add

