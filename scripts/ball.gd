extends CharacterBody2D


const SPEED := 350.0

func _physics_process(delta: float) -> void:
	var collision := move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func init(pos: Vector2) -> void:
	position = pos
	velocity = Vector2 (1, -1).normalized() * SPEED
