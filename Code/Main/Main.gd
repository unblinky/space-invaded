extends Node
class_name Main

const INVADER = preload("res://Invader/Invader.tscn")

@onready var score_board = $ScoreBoard
@onready var play_button = $GameOver/VBox/PlayButton
@onready var game_over = $GameOver

var invaders: Array
var bounds: float = 10.0
var row_height = 1.5 # meters.

func _ready():
	get_tree().change_scene_to_file("res://ScoreBoard/ScoreBoard.tscn")
	play_button.pressed.connect(OnPlayPressed)
	game_over.hide()
	SpawnInvader()

func OnPlayPressed():
	get_tree().reload_current_scene()


func SpawnInvader():
	invaders.clear()
	
	for i in 5:
		var invader = INVADER.instantiate()
		invader.score_board = score_board
		invader.main = self
		invader.position.x += i * row_height
		invader.position.y = 5
		invaders.append(invader)
		add_child(invader)

func _process(delta):
	for invader in invaders:
		if invader != null:
			if invader.position.x > bounds:
				Drop()
		
			if invader.position.x < -bounds:
				Drop()

func Drop():
	for invader in invaders:
		if invader != null:
			invader.speed *= -1
			invader.position.y -= row_height

