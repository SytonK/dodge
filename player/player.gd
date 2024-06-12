class_name Player
extends CharacterBody2D


@export var movement_speed: float = 500


func _physics_process(_delta: float) -> void:
	_move()
	move_and_slide()


func _move() -> void:
	velocity = Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized() * movement_speed


func _on_hurtbox_hurt() -> void:
	print('i was hurt')
