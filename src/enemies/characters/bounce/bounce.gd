class_name Bounce
extends CharacterBody2D


const EXPLOSION = preload("res://src/enemies attacks/attack with lifetime/explosion/explosion.tscn")

const ROTATION_SPEED_FACTOR: float = 0.002
const MAX_SPEED_FOR_ROTATION: float = 1000

@export var speed: float: set = _set_speed

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var explode_on_collision: bool = false


func _ready() -> void:
	_init_random_direction()
	collision_layer = 0


func _physics_process(delta: float) -> void:
	_move(delta)
	_rotate(delta)


func _init_random_direction() -> void:
	velocity = Vector2.RIGHT.rotated(randf_range(0, 2 * PI)) * speed

func _set_speed(new_speed: float) -> void:
	speed = new_speed
	velocity = velocity.normalized() * speed

func _move(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		_add_explosion()

func _rotate(delta: float) -> void:
	var direction = velocity.x/abs(velocity.x)
	var rotation_amount = min(speed, MAX_SPEED_FOR_ROTATION) * ROTATION_SPEED_FACTOR
	sprite_2d.rotation += direction * PI * rotation_amount * delta

func _add_explosion() -> void:
	if explode_on_collision:
		var new_explosion = EXPLOSION.instantiate()
		new_explosion.rotation = randf_range(0, 2 * PI)
		new_explosion.position = position
		new_explosion.top_level = true
		add_child(new_explosion)
