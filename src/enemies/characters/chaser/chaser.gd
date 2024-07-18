class_name Chaser
extends CharacterBody2D


const SPIKE = preload("res://src/enemies attacks/attack with lifetime/spike/spike.tscn")

@export var movement_speed: float

@export var is_recovering: bool = false
@onready var animation_player = $AnimationPlayer

@export var leavse_spike_trail: bool = false
@export var trail_duration: float
@export var trail_frequency: float = 0
var spiketrail_timer: Timer
@onready var spike_marker: Marker2D = $SpikeMarker


func _ready() -> void:
	_init_spike()

func _process(_delta: float) -> void:
	if !is_recovering:
		_chase_player()

func _chase_player() -> void:
	velocity = (PlayerRef.player_ref.position - position).normalized() * movement_speed
	rotation = velocity.angle()
	move_and_slide()


func _on_hitbox_hit():
	animation_player.play("recover")


func _init_spike() -> void:
	if trail_frequency > 0:
		spiketrail_timer = Timer.new()
		spiketrail_timer.wait_time = trail_frequency
		spiketrail_timer.timeout.connect(_on_spiketrail_timer_timeout)
		add_child(spiketrail_timer)
		spiketrail_timer.start()

func _on_spiketrail_timer_timeout() -> void:
	if leavse_spike_trail:
		var new_spike: Spike = SPIKE.instantiate()
		new_spike.top_level = true
		new_spike.lifetime = trail_duration
		new_spike.position = spike_marker.global_position
		add_child(new_spike)
