extends Node
class_name Main

const INVADER = preload("res://Invader/Invader.tscn")
@onready var score_board = $ScoreBoard

func _ready():
	SpawnInvader()

func SpawnInvader():
	# HACK: Do this better!
	for i in 5:
		var invader = INVADER.instantiate()
		invader.score_board = score_board
		invader.position.x += i * 1.5
		invader.position.y = 5
		add_child(invader)
