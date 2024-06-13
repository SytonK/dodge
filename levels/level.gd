class_name Level
extends Node2D


const PLAYER = preload("res://player/player.tscn")
var player: Player


func _ready() -> void:
	_add_player()

func _add_player() -> void:
	player = PLAYER.instantiate()
	add_child(player)
