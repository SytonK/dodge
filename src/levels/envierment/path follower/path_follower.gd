class_name PathFollower
extends PathFollow2D


@export var speed: float
@export var gradiant: Gradient

@onready var trail: Trail = $Trail


func _ready() -> void:
	trail.gradient = gradiant


func _process(delta: float) -> void:
	progress_ratio += speed * delta
