extends Node2D

const Ball = preload("res://BallWithMass.gd")

func _ready():
	for i in range(30):
		var mass = rand_range(0.1, 6.5)
		add_child(Ball.new(
			mass,
			30,
			30
		))
