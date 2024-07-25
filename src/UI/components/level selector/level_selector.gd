extends VBoxContainer


const BUTTON_TEXT: String = 'level '

const LEVEL_PATH0: String = 'res://src/levels/level '
const LEVEL_PATH1: String = '/level_'
const LEVEL_PATH2: String = '.tscn'

const MAX_LEVEL: int = 3

var level: int = 0: set = _set_level
@onready var select_level_button: ChangeSceneButton = $HBoxContainer/SelectLevelButton

const EMPTY_STAR = preload("res://assets/UI/stars/empty_star.png")
const FULL_STAR = preload("res://assets/UI/stars/full_star.png")
@onready var score_stars: Array[TextureRect] = [$ScoreUI/Star0, $ScoreUI/Star1, $ScoreUI/Star2]
var score: Score

func _ready() -> void:
	select_level_button.grab_focus()
	_init_score()

func _set_level(new_level: int) -> void:
	level = clamp(new_level, 0, MAX_LEVEL)
	_set_stars()
	if select_level_button:
		select_level_button.text = BUTTON_TEXT + str(level)
		select_level_button.file_path = LEVEL_PATH0 + str(level) + LEVEL_PATH1 + str(level) + LEVEL_PATH2


func _on_button_left_pressed() -> void:
	level -= 1

func _on_button_right_pressed() -> void:
	level += 1


func _init_score() -> void:
	score = Score.load()
	_set_stars()

func _set_stars() -> void:
	for star_index in score_stars.size():
		score_stars[star_index].texture = FULL_STAR if score.stars[level] > star_index else EMPTY_STAR
