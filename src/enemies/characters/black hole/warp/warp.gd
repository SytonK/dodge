class_name Warp
extends Area2D

@export var worp_strength: float

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


func _on_bullet_entered(area: Area2D) -> void:
	if area is Bullet:
		bullets.append(area)

func _on_bullet_exiced(area: Area2D) -> void:
	if area is Bullet:
		bullets.erase(area)

func _add_to_direction(bullet: Bullet, delta: float) -> void:
	var direction_to_add: Vector2 = (global_position - bullet.global_position).normalized() * worp_strength * delta
	bullet.direction += direction_to_add

