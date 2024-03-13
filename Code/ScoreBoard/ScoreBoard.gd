extends PanelContainer
class_name ScoreBoard

const SAVE_FILE: String = "user://save_game.dat"

@onready var score_ui = $VBox/ScoreUI
@onready var hi_score_ui = $VBox/HiScoreUI

var score: int = 0
var hi_score: int = 0

func _ready():
	Reset()
	#SaveData(str(score))
	LoadData()

func UpdateScore(delta_score: int):
	score += delta_score
	score_ui.text = str(score)
	if score > hi_score:
		hi_score = score
		hi_score_ui.text = str(hi_score)
		SaveData(str(hi_score))

func Reset():
	score = 0
	score_ui.text = str(score)

func SaveData(content: String):
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_string(content)

func LoadData():
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		hi_score = int(content)
		hi_score_ui.text = str(hi_score)
