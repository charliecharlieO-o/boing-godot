# Just a bouncing ball

![boing-gif](./gifs/boing.gif)

# A bouncing ball that follows your mouse

![follow-gif](./gifs/boing_v2.gif)

# Bouncing balls influneced by forces

![mass](./gifs/boing_v3.gif)

# Let's add friction!

![friction](./gifs/boing_v4.gif)

# Translating to Godot style

## Regular balls without friction

Balls as kinematic objects with collision areas. Regular velocity with gravity, no wind, no friction.
![gdnf](./gifs/gd_no_friction.gif)

## Balls with friction

Add friction to the kinematic objects
![gdf](./gifs/gd_friction.gif)

## Balls with the bounce function in godot

Add friction, gravity, wind and use the bounce function for vectors on godot.
```
var collide = move_and_collide(velocity)
if collide:
  # The bounce function seems to include some kind of friction
  velocity = velocity.bounce(collide.normal)
  # Use this to avoid the regular bounce friction
  velocity = velocity * collide.normal
```
![godot bounce](./gifs/gd_bounce_f.gif)
