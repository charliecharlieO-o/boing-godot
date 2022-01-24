extends Node2D

onready var window = Vector2(
	get_viewport().size.x,
	get_viewport().size.y
)

var ball: Vector2
var velocity := Vector2(1.0, 3.3)
var topspeed:float = 10.0
var acceleration: Vector2
var mouse_last_pos: Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	ball.x = get_viewport().size.x/2
	ball.y = get_viewport().size.y/2


func bounce():
	# Apply bouncing logic
	if ((ball.x > window.x) || (ball.x < 1)):
		velocity.x = velocity.x * -1.0
	if ((ball.y > window.y) || (ball.y < 1)):
		velocity.y = velocity.y * -1.0

func follow_mouse():
	# Get mouse pos
	var mouse = get_viewport().get_mouse_position()
	if mouse == mouse_last_pos:
		acceleration = velocity.normalized()
		return
	if ((mouse.x > window.x) || (mouse.x < 1)):
		acceleration = velocity.normalized()
		return
	if ((mouse.y > window.y) || (mouse.y < 1)):
		acceleration = velocity.normalized()
		return
	# Compute direction
	var direction = mouse - ball
	# Normalize and Scale
	acceleration = direction.normalized() * 5
	# Set last mouse position
	mouse_last_pos = mouse

func _process(delta):
	update()

func _draw():
	follow_mouse()
	bounce()
	# Change balls location
	velocity = velocity + acceleration
	velocity = velocity.clamped(topspeed) # limit velocity max 10
	ball = ball + velocity
	draw_circle(ball, 20.0, Color.greenyellow)
