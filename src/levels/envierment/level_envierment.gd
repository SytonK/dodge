class_name LevelEnvierment
extends StaticBody2D

@export var gradiants1: Array[Gradient]
@export var gradiants2: Array[Gradient]


@onready var path_follower: PathFollower = $Path2D/PathFollower
@onready var path_follower_2: PathFollower = $Path2D/PathFollower2


func _ready() -> void:
	change_difficulty(0)

func change_difficulty(difficulty: int) -> void:
	path_follower.gradiant = gradiants1[difficulty]
	path_follower_2.gradiant = gradiants2[difficulty]
