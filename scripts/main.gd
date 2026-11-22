extends Node

const POINT_PER_BRICK := 10
var score := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Paddle.start($PaddlePosition.position)
	$Ball.init($BallPosition.position)
	$BrickWall.init($WallPosition.position)
	$BrickWall.brick_destroyed.connect(_on_brick_destroyed)
	$BrickWall.all_bricks_destroyed.connect(_on_all_bricks_destroyed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_brick_destroyed() -> void:
	score += POINT_PER_BRICK
	print(score)
	
func _on_all_bricks_destroyed() -> void:
	pass
	print("GG!")
