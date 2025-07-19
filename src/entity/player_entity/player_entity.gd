extends Entity
class_name PlayerEntity

var input = Vector2.ZERO
var rotation_direction = 90
var friction = 20


func _physics_process(delta: float) -> void:
	player_movement(delta)

func get_input():
	rotation_direction = Input.get_axis("move_left", "move_right")
	input = transform.x * Input.get_axis("move_down","move_up")
	return input

func player_movement(delta):
	input = get_input()
	print(input)
	rotation += rotation_direction * 5 * delta

	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += input * delta * 500
		velocity = velocity.limit_length(500)

	move_and_slide()
