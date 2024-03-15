extends Area3D
class_name Invader

var score_board: ScoreBoard
var main: Main
var speed: float = 5.0 # m / sec.
var points: int = 13

func _ready():
	area_entered.connect(OnAreaEntered)


func _process(delta):
	position.x += speed * delta


func OnAreaEntered(other_area: Area3D):
	if other_area is Lazer:
		score_board.UpdateScore(points)
		main.invaders.erase(other_area) # TODO: Not erasing.
		other_area.queue_free()
		#call_deferred("queue_free")
		queue_free()
	if other_area is Ship:
		print("GameOver / Ship life?")
		main.game_over.show()
