class_name Bounce
extends CharacterBody2D


const ROTATION_SPEED_FACTOR: float = 0.002
const MAX_SPEED_FOR_ROTATION: float = 1000

@export var speed: float: set = _set_speed
@export var init_direction: Vector2 = Vector2(1,1)

@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	velocity = init_direction.normalized() * speed
	collision_layer = 0


func _physics_process(delta: float) -> void:
	_move(delta)
	_rotate(delta)


func _set_speed(new_speed: float) -> void:
	speed = new_speed
	velocity = velocity.normalized() * speed

func _move(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _rotate(delta: float) -> void:
	var direction = velocity.x/abs(velocity.x)
	var rotation_amount = min(speed, MAX_SPEED_FOR_ROTATION) * ROTATION_SPEED_FACTOR
	sprite_2d.rotation += direction * PI * rotation_amount * delta
