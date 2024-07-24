class_name LevelEnvierment
extends StaticBody2D


const MAX_SPEED: float = 0.7
const MAX_SPEED_REDUCE: float = 0.6
const MAX_SECONDS_FOR_REDUCE: int = 15


@export var gradiants1: Array[Gradient]
@export var gradiants2: Array[Gradient]


@onready var path_follower: PathFollower = $Path2D/PathFollower
@onready var path_follower_2: PathFollower = $Path2D/PathFollower2


func _ready() -> void:
	change_difficulty(0)

func change_difficulty(difficulty: int) -> void:
	path_follower.gradiant = gradiants1[difficulty]
	path_follower_2.gradiant = gradiants2[difficulty]

func set_new_speed(time_left: int) -> void:
	var new_speed = MAX_SPEED - MAX_SPEED_REDUCE * clamp(time_left, 0, MAX_SECONDS_FOR_REDUCE)/MAX_SECONDS_FOR_REDUCE
	path_follower.speed = new_speed
	path_follower_2.speed = new_speed
