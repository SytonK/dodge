class_name TargetPlayerTower
extends TimedAttacker


const BULLET = preload("res://src/enemies attacks/projectiles/bullet/bullet.tscn")

const DISABLED_COLOR: Color = Color(0.3, 0.05, 0.05)
const ACTIVE_COLOR: Color = Color(0.8, 0.15, 0.15)

const BULLET_COLOR: Color = Color(0.9, 0, 0)


@onready var sprite_2d: Sprite2D = $Sprite2D

@export var speed: float


func _set_disabled(new_disabled: bool) -> void:
	super._set_disabled(new_disabled)
	if sprite_2d:
		sprite_2d.modulate = DISABLED_COLOR if disabled else ACTIVE_COLOR


func _on_timer_timeout() -> void:
	_spawn_bullet()

func _spawn_bullet() -> void:
	var new_bullet = BULLET.instantiate()
	new_bullet.movment_speed = speed
	new_bullet.direction = PlayerRef.player_ref.global_position - global_position
	new_bullet.modulate = Colors.get_bullet_color(new_bullet, BULLET_COLOR)
	add_child(new_bullet)
