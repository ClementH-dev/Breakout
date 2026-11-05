extends StaticBody2D
signal destroyed

func hit() -> void:
	destroyed.emit()
	queue_free()
