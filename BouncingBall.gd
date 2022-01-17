extends Node2D

onready var window = Vector2(
	get_viewport().size.x,
	get_viewport().size.y
)

var ball: Vector2
var speed := Vector2(1.0, 3.3)


# Called when the node enters the scene tree for the first time.
func _ready():
	ball.x = get_viewport().size.x/2
	ball.y = get_viewport().size.y/2


func bounce():
	# You can add vectors directly with GDscript
	ball = ball + speed
	if ((ball.x > window.x) || (ball.x < 1)):
		speed.x = speed.x * -1.0
	if ((ball.y > window.y) || (ball.y < 1)):
		speed.y = speed.y * -1.0

func _process(delta):
	update()

func _draw():
	bounce()
	draw_circle(ball, 20.0, Color.blueviolet)
