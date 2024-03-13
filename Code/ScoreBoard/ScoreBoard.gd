extends PanelContainer
class_name ScoreBoard

const SAVE_FILE = "user://save_game.dat"

@onready var score_ui = $VBox/ScoreUI
@onready var hi_score_ui = $VBox/HiScoreUI

var score: int = 0
var hi_score: int = 23

func _ready():
	Reset()
	Load()

func UpdateScore(delta_score: int):
	score += delta_score
	score_ui.text = str(score)
	if score > hi_score:
		hi_score = score
		hi_score_ui.text = str(hi_score)
		Save()


func Reset():
	score = 0
	score_ui.text = str(score)


func Save():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	if file:
		file.store_string(str(hi_score))

func Load():
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	if file:
		hi_score = int(file.get_as_text())
		hi_score_ui.text = str(hi_score)
