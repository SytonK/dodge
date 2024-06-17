class_name TargetPlayerTower
extends StaticBody2D

@export var disabled: bool = false : set = _set_disabled
@onready var polygon_2d: Polygon2D = $Polygon2D


func _ready() -> void:
	_set_disabled(disabled)

func _set_disabled(new_disabled: bool) -> void:
	disabled = new_disabled
	if polygon_2d:
		polygon_2d.color = Color(0.2, 0.2, 0.2) if disabled else Color(0.9, 0.9, 0.9)
