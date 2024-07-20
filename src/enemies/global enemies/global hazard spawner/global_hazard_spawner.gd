class_name GlobalHazardSpawner
extends TimedAttacker


const HAZARD = preload("res://src/enemies attacks/attack with lifetime/hazard/hazard.tscn")


@export var lifetime: float
@export var setup_time: float

@export var hazard_scale: Vector2 = Vector2(1,1)


func _on_timer_timeout() -> void:
	_spawn_hazard()

func _spawn_hazard() -> void:
	var new_hazard: Hazard = HAZARD.instantiate()
	new_hazard.lifetime = lifetime
	new_hazard.setup_time = setup_time
	new_hazard.position = _get_new_hazard_position()
	new_hazard.scale = hazard_scale
	add_child(new_hazard)

func _get_new_hazard_position() -> Vector2:
	return PlayerRef.player_ref.position
