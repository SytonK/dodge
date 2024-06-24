class_name Chaser
extends CharacterBody2D


@export var movement_speed: float

@export var is_recovering: bool = false
@onready var animation_player = $AnimationPlayer

@export var leavse_fire_trail: bool = false
@export var trail_duration: float
@export var trail_polygon: PackedVector2Array


func _process(_delta: float) -> void:
	if !is_recovering:
		_chase_player()

func _chase_player() -> void:
	velocity = (PlayerRef.player_ref.position - position).normalized() * movement_speed
	rotation = velocity.angle()
	move_and_slide()


func _on_hitbox_hit():
	print('recover')
	animation_player.play("recover")


func _leave_fire_trial() -> void:
	var new_fire: Fire = Fire.new()
	new_fire.top_level = true
	new_fire.lifetime = trail_duration
	new_fire.position = position
	new_fire.polygon_packed_vector_array = trail_polygon
	new_fire.polygon_color = Color(0.7, 0.1, 0.1)
	add_child(new_fire)


func _on_firetrail_timer_timeout() -> void:
	if leavse_fire_trail:
		_leave_fire_trial()
