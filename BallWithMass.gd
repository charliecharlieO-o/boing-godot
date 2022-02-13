extends Node2D

const ball_color = Color(0.148804, 0.71875, 0.29129, 0.694118)
onready var window = Vector2(
	get_viewport().size.x,
	get_viewport().size.y
)

var location: Vector2
var velocity: Vector2
var acceleration: Vector2
var mass: float

func _ready():
	velocity = Vector2(0, 0)
	acceleration = Vector2(0, 0)

func _applyForce(force: Vector2):
	# Newton's law
	# Net Force equals mass times acceleration.
	# Receive a force, divide by mass and add to acceleration
	var f := force/mass
	# force accumulation
	acceleration = acceleration + f

func _updateForces():
	# Motion 101
	velocity = velocity + acceleration
	location = location + velocity
	# clear acceleration
	acceleration = Vector2.ZERO

func _checkEdges():
	if ((location.x > window.x) || (location.x < 1)):
		velocity.x = velocity.x * -1.0
	if ((location.y > window.y) || (location.y < 1)):
		velocity.y = velocity.y * -1.0

func _draw():
	_applyForce(Vector2(0.01, 0))
	_applyForce(Vector2(0, 0.1))
	_updateForces()
	_checkEdges()
	draw_circle(location, 20.0 * self.mass, ball_color)

func _process(delta):
	update()

func _init(mass: float, x_pos: int, y_pos: int):
	self.mass = mass
	self.location = Vector2(x_pos, y_pos)
