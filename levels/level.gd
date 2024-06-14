class_name Level
extends Node2D

enum {
	EASY,
	NORMAL,
	HARD
}

@export var easy_time: int
@export var normal_time: int
@export var hard_time: int
var current_difficulty: int = EASY
var level_timer: Timer
var time_left: int

const PLAYER = preload("res://player/player.tscn")
var player: Player

const LEVEL_UI = preload("res://UI/level UI/level_ui.tscn")
var game_over_menu: Control
var pause_menu: Control
var time_label: Label 

var music_player: MusicPlayer

func _ready() -> void:
	_add_player()
	_add_level_ui()
	_add_level_timer()
	_add_music_player()


func _add_player() -> void:
	player = PLAYER.instantiate()
	add_child(player)
	player.game_over.connect(_on_game_over)


func _add_level_ui() -> void:
	add_child(LEVEL_UI.instantiate())
	game_over_menu = $LevelUI/GameOverMenu
	pause_menu = $LevelUI/PauseMenu
	time_label = $LevelUI/TimeLabel


func _add_level_timer() -> void:
	level_timer = Timer.new()
	level_timer.autostart = true
	level_timer.timeout.connect(_on_level_timer_timeout)
	add_child(level_timer)
	time_left = easy_time
	time_label.text = str(time_left)
	time_label.modulate = Color(0,1,0)


func _on_level_timer_timeout() -> void:
	time_left -= 1
	if time_left < 0:
		_next_difficulty()
	time_label.text = str(time_left)


func _next_difficulty() -> void:
	match current_difficulty:
		EASY:
			_to_normal()
		NORMAL:
			_to_hard()
		HARD:
			print('open next level')


func _to_normal() -> void:
	current_difficulty = NORMAL
	time_label.modulate = Color(1,1,0)
	time_left = normal_time
	music_player.set_music(MusicPlayer.MUSIC_LEVEL.NORMAL)

func _to_hard() -> void:
	current_difficulty = HARD
	time_label.modulate = Color(1,0,0)
	time_left = hard_time
	music_player.set_music(MusicPlayer.MUSIC_LEVEL.HARD)


func _add_music_player() -> void:
	music_player = MusicPlayer.new()
	add_child(music_player)


func _on_game_over() -> void:
	game_over_menu.visible = true
	get_tree().paused = true
	pause_menu.process_mode = Node.PROCESS_MODE_DISABLED
