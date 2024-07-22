class_name PathFollower
extends PathFollow2D


@export var speed: float
@export var gradiant: Gradient : set = _set_gradiant

@onready var trail: Trail = $Trail


func _ready() -> void:
	_set_gradiant(gradiant)

func _process(delta: float) -> void:
	progress_ratio += speed * delta


func _set_gradiant(new_gradiant: Gradient) -> void:
	if trail:
		gradiant = new_gradiant
		trail.gradient = gradiant
