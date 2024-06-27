class_name Score
extends Resource


const PATH: String = "user://score.tres"

@export var stars: Array[int] = [0, 0, 0, 0]


func save() -> void:
	ResourceSaver.save(self, PATH)

static func load() -> Score:
	var res: Score = load(PATH) as Score
	if !res:
		res = Score.new()
	return res


func set_stars(level_number: int, level_stars: int) -> void:
	stars[level_number] = clamp(level_stars, stars[level_number], 3)
