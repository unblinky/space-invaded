extends Area3D
class_name Ship

const LAZER = preload("res://Lazer/Lazer.tscn")
var speed: float = 10.0
var ship_height = 3.0

func _ready():
	pass # Replace with function body.

func _process(delta):
	# Player Movement.
	if Input.is_action_pressed("move_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("move_right"):
		position.x += speed * delta
	
	# Player Fire.
	if Input.is_action_just_pressed("fire"):
		Fire()

func Fire():
	var lazer = LAZER.instantiate()
	lazer.position = position
	lazer.position.y += ship_height
	get_parent().add_child(lazer)


