class_name PathFollower
extends PathFollow2D


@export var speed: float


func _process(delta: float) -> void:
	progress_ratio += speed * delta
