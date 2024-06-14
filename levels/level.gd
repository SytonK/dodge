class_name Level
extends Node2D


@export var easy_time: int
@export var normal_time: int
@export var hard_time: int
var level_timer: Timer
var time_left: int

const PLAYER = preload("res://player/player.tscn")
var player: Player

const LEVEL_UI = preload("res://UI/level UI/level_ui.tscn")
var game_over_menu: Control
var pause_menu: Control


func _ready() -> void:
	_add_player()
	_add_level_ui()
	_add_level_timer()


func _add_player() -> void:
	player = PLAYER.instantiate()
	add_child(player)
	player.game_over.connect(_on_game_over)


func _add_level_ui() -> void:
	add_child(LEVEL_UI.instantiate())
	game_over_menu = $LevelUI/GameOverMenu
	pause_menu = $LevelUI/PauseMenu


func _add_level_timer() -> void:
	level_timer = Timer.new()
	level_timer.autostart = true
	level_timer.timeout.connect(_on_level_timer_timeout)
	add_child(level_timer)
	time_left = easy_time


func _on_level_timer_timeout() -> void:
	time_left -= 1

func _on_game_over() -> void:
	game_over_menu.visible = true
	get_tree().paused = true
	pause_menu.process_mode = Node.PROCESS_MODE_DISABLED
