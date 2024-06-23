class_name Player
extends CharacterBody2D


signal game_over

@export var movement_speed: float = 500

@export var max_health: int = 4
@onready var health: int = max_health
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
	move_and_slide()


func _move() -> void:
	velocity = Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized() * movement_speed


func _on_hurtbox_hurt() -> void:
	health -= 1
	audio_stream_player.play()
	animation_player.play('invulnerable')
	health_ui.update_health(health)
	if health <= 0:
		_game_over()

func _game_over() -> void:
	game_over.emit()


func _set_is_invulnerable(new_is_invulnerable: bool) -> void:
	is_invulnerable = new_is_invulnerable
	hurtbox.monitoring = !is_invulnerable
	polygon_2d.color = Color(1,1,1,0.4 if is_invulnerable else 1.0)
	
