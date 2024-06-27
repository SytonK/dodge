class_name Player
extends CharacterBody2D


signal game_over
signal hurt

@export var movement_speed: float = 500

@export var max_health: int = 4
@onready var health: int = max_health
@onready var health_polygons: Array[Polygon2D] = [$Health/Health1, $Health/Health2, $Health/Health3, $Health/Health4]
const NO_HEALTH_COLOR: Color = Color(0.15, 0.3, 0.15)
@onready var health_ui: HealthUI = $CanvasLayer/HealthUI

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var is_invulnerable: bool = false : set = _set_is_invulnerable
@onready var hurtbox: Hurtbox = $Hurtbox
@onready var polygon_2d: Polygon2D = $Polygon2D


func _ready() -> void:
	PlayerRef.player_ref = self

func _physics_process(_delta: float) -> void:
	_move()


func _move() -> void:
	if health <= 0:
		return
	
	velocity = Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized() * movement_speed
	
	move_and_slide()


func _on_hurtbox_hurt() -> void:
	health -= 1
	audio_stream_player.play()
	animation_player.play('invulnerable')
	_update_health_ui()
	health_ui.update_health(health)
	hurt.emit()
	if health <= 0:
		_game_over()

func _update_health_ui() -> void:
	health_polygons[max_health - health - 1].color = NO_HEALTH_COLOR


func _game_over() -> void:
	game_over.emit()


func _set_is_invulnerable(new_is_invulnerable: bool) -> void:
	is_invulnerable = new_is_invulnerable
	hurtbox.monitoring = !is_invulnerable
	polygon_2d.color = Color(1,1,1,0.4 if is_invulnerable else 1.0)
	
