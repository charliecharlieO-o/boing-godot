extends Node2D

const Ball = preload("res://BallWithMass.gd")

func _ready():
	var ball = Ball.new(1, 2, 3)
	add_child(ball)
