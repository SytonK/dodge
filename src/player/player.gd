class_name Player
extends CharacterBody2D


const NO_HEALTH_COLOR: Color = Color(0.1, 0.2, 0.1)


signal game_over
signal hurt


@export var movement_speed: float = 500

@export var max_health: int = 4
@onready var health: int = max_health : set = _set_health
@onready var health_polygons: Array[Polygon2D] = [$Health/Health1, $Health/Health2, $Health/Health3, $Health/Health4]

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

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
	_update_health_ui()
	hurt.emit()
	if health <= 0:
		hurtbox.monitoring = false
		_game_over()
	else:
		animation_player.play('invulnerable')

func _set_health(new_health: int) -> void:
	health = clamp(new_health, 0, max_health)

func _update_health_ui() -> void:
	health_polygons[max_health - health - 1].color = NO_HEALTH_COLOR


func _game_over() -> void:
	game_over.emit()
