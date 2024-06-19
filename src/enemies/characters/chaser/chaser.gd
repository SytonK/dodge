class_name Chaser
extends CharacterBody2D


@export var movement_speed: float

@export var is_recovering: bool = false
@onready var animation_player = $AnimationPlayer

const FIRE = preload("res://src/enemies attacks/fire/fire.tscn")
@export var leavse_fire_trail: bool = false


func _process(_delta: float) -> void:
	if !is_recovering:
		_chase_player()

func _chase_player() -> void:
	velocity = (PlayerRef.player_ref.position - position).normalized() * movement_speed
	rotation = velocity.angle()
	move_and_slide()


func _on_hitbox_hit():
	animation_player.play("recover")


func _leave_fire_trial() -> void:
	var new_fire: Fire = FIRE.instantiate()
	new_fire.top_level = true
	new_fire.lifetime = 2
	new_fire.position = position
	add_child(new_fire)


func _on_firetrail_timer_timeout() -> void:
	if leavse_fire_trail:
		_leave_fire_trial()
