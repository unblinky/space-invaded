extends Area3D
class_name Lazer

var speed: float = 20.0 # m / sec.

func _process(delta):
	position.y += speed * delta
