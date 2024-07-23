class_name Level
extends Node2D

enum {
	EASY,
	NORMAL,
	HARD,
	ENDLESEE
}

const EASY_COLOR: Color = Color(0,1,0)
const NORMAL_COLOR: Color = Color(1,1,0)
const HARD_COLOR: Color = Color(1,0,0)
const ENDLESS_COLOR: Color = Color(0.2,0.9,0.7)

const MUSIC_VOLUME_DIM_WEIGTH: float = 2
const MUSIC_VOLUME_DIM_WEIGTH_GAME_OVER: float = 0.2
const MUSIC_VOLUME_DIM_VALUE: float = -15

const LEVEL_ENVIERMENT = preload("res://src/levels/envierment/level_envierment.tscn")

@export var easy_time: int
@export var normal_time: int
@export var hard_time: int
var current_difficulty: int = EASY
var level_timer: Timer
var time_left: int

var camera: Camera

const PLAYER = preload("res://src/player/player.tscn")
var player: Player
@export var player_start_position: Vector2 = Vector2(0, 0)

const LEVEL_UI = preload("res://src/UI/level UI/level_ui.tscn")

var game_over_menu: Control
var pause_menu: Control
var time_label: Label
var stars: Stars

var music_player: MusicPlayer

const LOSE_SOUND = preload("res://assets/sounds/lose sound.mp3")
var audio_stream_player: AudioStreamPlayer

@export var level_number: int
var game_over: bool = false

@export var level_envierment: LevelEnvierment

func _ready() -> void:
	_add_level_envierments()
	_add_camera()
	_add_player()
	_add_level_ui()
	_add_level_timer()
	_add_music_player()
	_add_level_sounds()

func _process(_delta: float) -> void:
	_slow_engine_on_game_over()


func _add_level_envierments() -> void:
	level_envierment = LEVEL_ENVIERMENT.instantiate()
	add_child(level_envierment)
	move_child(level_envierment, 0)

func _add_camera() -> void:
	camera = Camera.new()
	add_child(camera)

func _add_player() -> void:
	player = PLAYER.instantiate()
	player.position = player_start_position
	player.game_over.connect(_on_game_over)
	player.hurt.connect(camera.shake)
	add_child(player)

func _add_level_ui() -> void:
	add_child(LEVEL_UI.instantiate())
	game_over_menu = $LevelUI/GameOverMenu
	pause_menu = $LevelUI/PauseMenu
	time_label = $LevelUI/TimeLabel
	stars = $LevelUI/Stars

func _add_level_timer() -> void:
	level_timer = Timer.new() 
	level_timer.autostart = true
	level_timer.timeout.connect(_on_level_timer_timeout)
	add_child(level_timer)
	time_left = easy_time
	time_label.text = str(time_left)
	time_label.modulate = EASY_COLOR

func _add_music_player() -> void:
	music_player = MusicPlayer.new()
	music_player.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(music_player)

func _add_level_sounds() -> void:
	audio_stream_player = AudioStreamPlayer.new()
	audio_stream_player.bus = 'SFX'
	audio_stream_player.stream = LOSE_SOUND
	audio_stream_player.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(audio_stream_player)


func _on_level_timer_timeout() -> void:
	time_left = time_left + (1 if current_difficulty == ENDLESEE else -1)
	if current_difficulty != ENDLESEE:
		level_envierment.set_new_speed(time_left)
	if time_left < 0:
		_next_difficulty()
	_music_down()
	time_label.text = str(time_left)

func _music_down() -> void:
	if game_over || (time_left == 2 && current_difficulty != ENDLESEE && current_difficulty != HARD):
		var tween = get_tree().create_tween()
		tween.tween_property(music_player, "volume_db", MUSIC_VOLUME_DIM_VALUE, 
			MUSIC_VOLUME_DIM_WEIGTH_GAME_OVER if game_over else MUSIC_VOLUME_DIM_WEIGTH)

func _music_up() -> void:
	if current_difficulty != ENDLESEE:
		var tween = get_tree().create_tween()
		tween.tween_property(music_player, "volume_db", 0, MUSIC_VOLUME_DIM_WEIGTH)


func _next_difficulty() -> void:
	stars.add_star(current_difficulty)
	match current_difficulty:
		EASY:
			_to_normal()
		NORMAL:
			_to_hard()
		HARD:
			_to_endless()
	level_envierment.change_difficulty(current_difficulty)
	_music_up()



func _to_normal() -> void:
	current_difficulty = NORMAL
	time_label.modulate = NORMAL_COLOR
	time_left = normal_time
	music_player.set_music(MusicPlayer.MUSIC_LEVEL.NORMAL)

func _to_hard() -> void:
	current_difficulty = HARD
	time_label.modulate = HARD_COLOR
	time_left = hard_time
	music_player.set_music(MusicPlayer.MUSIC_LEVEL.HARD)

func _to_endless() -> void:
	current_difficulty = ENDLESEE
	time_label.modulate = ENDLESS_COLOR
	time_left = 0


func _on_game_over() -> void:
	audio_stream_player.play()
	game_over = true
	_music_down()

func _slow_engine_on_game_over() -> void:
	if !game_over:
		return
	
	Engine.time_scale = lerpf(Engine.time_scale, 0, 0.03)
	if Engine.time_scale <= 0.05:
		game_over = false
		Engine.time_scale = 1
		_on_finish_game_over()

func _on_finish_game_over() -> void:
	_save_player_score()
	game_over_menu.visible = true
	pause_menu.process_mode = Node.PROCESS_MODE_DISABLED
	get_tree().paused = true

func _save_player_score() -> void:
	var save_score: Score = Score.load()
	save_score.set_stars(level_number, current_difficulty)
	if current_difficulty == ENDLESEE:
		save_score.set_score(level_number, time_left)
	save_score.save()
