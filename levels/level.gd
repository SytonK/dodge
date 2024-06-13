class_name Level
extends Node2D


const PLAYER = preload("res://player/player.tscn")
var player: Player

const LEVEL_UI = preload("res://UI/level UI/level_ui.tscn")
var game_over_menu: Control
var pause_menu: Control


func _ready() -> void:
	_add_player()
	_add_level_ui()

func _add_player() -> void:
	player = PLAYER.instantiate()
	add_child(player)
	player.game_over.connect(_on_game_over)

func _add_level_ui() -> void:
	add_child(LEVEL_UI.instantiate())
	game_over_menu = $LevelUI/GameOverMenu
	pause_menu = $LevelUI/PauseMenu

func _on_game_over() -> void:
	game_over_menu.visible = true
	get_tree().paused = true
	pause_menu.process_mode = Node.PROCESS_MODE_DISABLED
