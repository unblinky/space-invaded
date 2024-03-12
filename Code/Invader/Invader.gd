extends Area3D
class_name Invader

var row_height = 1.0 # meters.
var speed: float = 5.0 # m / sec.
var bounds: float = 10.0

func _ready():
	area_entered.connect(OnAreaEntered)

func _process(delta):
	position.x += speed * delta
	
	if position.x > bounds:
		position.x = bounds
		speed *= -1
		position.y -= row_height
	
	if position.x < -bounds:
		position.x = -bounds
		speed *= -1
		position.y -= row_height

func OnAreaEntered(other_area: Area3D):
	if other_area is Lazer:
		other_area.queue_free()
		queue_free()
	if other_area is Ship:
		print("GameOver / Ship life?")
