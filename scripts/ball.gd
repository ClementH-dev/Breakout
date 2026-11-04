extends CharacterBody2D


const SPEED := 350.0
const MAX_BOUNCE_ANGLE := deg_to_rad(60.0) # Degré max de rebond

func _physics_process(delta: float) -> void:
	var collision := move_and_collide(velocity * delta)
	if collision:
		var collider := collision.get_collider()
		if collider.is_in_group("paddle"):
			_bounce_on_paddle(collider)
		else:
			velocity = velocity.bounce(collision.get_normal())

func _bounce_on_paddle(paddle: Node2D) -> void:
	var shape: RectangleShape2D = paddle.get_node("CollisionShape2D").shape
	var half_width := shape.size.x / 2.0 # Moitié de la taille de la raquête
	var offset := clampf((global_position.x - paddle.global_position.x) / half_width, -1.0, 1.0)
	var angle := offset * MAX_BOUNCE_ANGLE
	velocity = Vector2(sin(angle), -cos(angle)) * SPEED
	
func init(pos: Vector2) -> void:
	position = pos
	velocity = Vector2 (1, -1).normalized() * SPEED
