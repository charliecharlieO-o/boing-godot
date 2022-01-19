extends Node2D

onready var window = Vector2(
	get_viewport().size.x,
	get_viewport().size.y
)

var ball: Vector2
var velocity := Vector2(1.0, 3.3)
var topspeed:float = 10.0


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
	# acceleration increases in the same direction
	var acceleration: Vector2 = velocity.normalized()
	# You can add vectors directly with GDscript
	velocity = velocity + velocity.normalized()
	velocity = velocity.clamped(topspeed) # limit velocity max 10
	ball = ball + velocity

func _process(delta):
	update()

func _draw():
	bounce()
	draw_circle(ball, 20.0, Color.blueviolet)
