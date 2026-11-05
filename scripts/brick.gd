extends StaticBody2D
signal destroyed

func get_size() -> Vector2:
	var shape = $CollisionShape2D.shape as RectangleShape2D
	return shape.size
	
func hit() -> void:
	destroyed.emit()
	queue_free()
