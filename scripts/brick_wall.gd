extends Node2D
signal all_bricks_destroyed

@export var brick_scene: PackedScene
@export var columns := 10
@export var rows := 5
@export var brick_size := Vector2(60, 20)
@export var spacing := Vector2(0,0)

var bricks_left := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func build_wall() -> void:
	var total_width := columns * brick_size.x + (columns - 1) * spacing.x
	var offset_x := -total_width / 2.0 + brick_size.x / 2.0
	
	for row in rows:
		for col in columns:
			var brick = brick_scene.instantiate()
			brick.position = Vector2(
				offset_x + col * (brick_size.x + spacing.x),
				row * (brick_size.y + spacing.y)
			)
			brick.destroyed.connect(_on_brick_destroyed)
			add_child(brick)
			bricks_left += 1

func _on_brick_destroyed() -> void:
	bricks_left -= 1
	if bricks_left == 0:
		all_bricks_destroyed.emit()

func init(pos) -> void:
	position = pos
	build_wall()
