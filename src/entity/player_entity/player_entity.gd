extends Entity
class_name PlayerEntity

var input = Vector2.ZERO

func _physics_process(delta: float) -> void:
    player_movement(delta)

func get_input():
    input.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
    input.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
    print(input)
    return input.normalized()

func player_movement(delta):
    input = get_input()

    velocity = input * 5000 * delta * 2
    print(velocity)
    move_and_slide()