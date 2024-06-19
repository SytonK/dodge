class_name Chaser
extends CharacterBody2D


@export var movement_speed: float

@export var is_recovering: bool = false

@onready var animation_player = $AnimationPlayer

func _process(_delta: float) -> void:
	if !is_recovering:
		_chase_player()

func _chase_player() -> void:
	velocity = (PlayerRef.player_ref.position - position).normalized() * movement_speed
	rotation = velocity.angle()
	move_and_slide()


func _on_hitbox_hit():
	animation_player.play("recover")
