class_name Bounce
extends CharacterBody2D


@export var speed: float
@export var init_direction: Vector2 = Vector2(1,1)


func _ready() -> void:
	velocity = init_direction.normalized() * speed
	collision_layer = 0


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
