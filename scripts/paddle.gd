extends CharacterBody2D


const SPEED = 400.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED
	move_and_slide()
