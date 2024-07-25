class_name PathFollower
extends PathFollow2D


@export var speed: float
@export var gradiant: Gradient : set = _set_gradiant

@export var max_length: int = 60
@onready var trail: Trail = $Trail


func _ready() -> void:
	_set_gradiant(gradiant)
	trail.max_length = max_length

func _process(delta: float) -> void:
	progress_ratio += speed * delta


func _set_gradiant(new_gradiant: Gradient) -> void:
	gradiant = new_gradiant
	if trail:
		trail.gradient = gradiant
