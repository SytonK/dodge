class_name Player
extends CharacterBody2D


signal game_over

@export var movement_speed: float = 500

@export var max_health: int = 4
@onready var health: int = max_health
@onready var health_ui: HealthUI = $CanvasLayer/HealthUI


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
	health_ui.update_health(health)
	if health <= 0:
		_game_over()

func _game_over() -> void:
	game_over.emit()
