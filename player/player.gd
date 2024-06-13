class_name Player
extends CharacterBody2D


@export var movement_speed: float = 500

@export var max_health: int = 4
@onready var health: int = max_health


func _physics_process(_delta: float) -> void:
	_move()
	move_and_slide()


func _move() -> void:
	velocity = Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized() * movement_speed


func _on_hurtbox_hurt() -> void:
	health -= 1
	if health <= 0:
		_game_over()

func _game_over() -> void:
	print('game_over')
