class_name Chaser
extends CharacterBody2D


@export var movement_speed: float


func _process(_delta: float) -> void:
	_chase_player()

func _chase_player() -> void:
	velocity = (PlayerRef.player_ref.position - position).normalized() * movement_speed
	rotation = velocity.angle()
	move_and_slide()
