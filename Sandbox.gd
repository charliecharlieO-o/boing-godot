extends Node2D

const Ball = preload("res://BallWithMass.gd")

func _ready():
	for i in range(30):
		add_child(Ball.new(
			rand_range(0.1, 6.5),
			30,
			30
		))
