extends KinematicBody2D


const wind = Vector2(0.01, 0)
const gravity_const = 0.1

# Basic Forces
var velocity: Vector2
var acceleration: Vector2
var mass: float = 1

# Friction
var c: float = 0.01
var normal: float = 1
var frictionMag: float = c * normal


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
	# clear acceleration
	acceleration = Vector2.ZERO

func _physics_process(delta):
	# Scaling gravity by mass
	var gravity = Vector2(0, gravity_const * self.mass)

	# Apply forces
	_applyForce(wind)
	_applyForce(gravity)

	# Apply friction
	var friction = self.velocity # Copy velocity
	friction = friction * -1 # Invert direction
	# We normalize the vector. This is because the mag of friction is not associated 
	# with how fast the ball moves, and we want to scale it easily
	friction = friction.normalized()
	friction = friction * frictionMag
	_applyForce(friction)
	
	_updateForces()
	var collide = move_and_collide(velocity)
	if collide:
		# The bounce function seems to include some kind of friction
		velocity = velocity.bounce(collide.normal)
		# Use this to avoid the regular bounce friction
		#velocity = velocity * collide.normal
