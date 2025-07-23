extends Node2D
class_name ControlComponent

@export var focus_entity: Entity

var rotation_direction = 0
var input = Vector2.ZERO
var friction = 100

func _physics_process(delta) -> void:
    player_movement(delta)
    return

func get_input():
    rotation_direction = Input.get_axis("move_left", "move_right")
    input = focus_entity.transform.x * Input.get_axis("move_down","move_up")
    return input

func player_movement(delta):
    input = get_input()
    print(input)
    focus_entity.rotation += rotation_direction * 5 * delta

    if input == Vector2.ZERO:
        if focus_entity.velocity.length() > (friction * delta):
            focus_entity.velocity -= focus_entity.velocity.normalized() * (friction * delta)
        else:
            focus_entity.velocity = Vector2.ZERO
    else:
        focus_entity.velocity += input * delta * 500
        focus_entity.velocity = focus_entity.velocity.limit_length(500)

    focus_entity.move_and_slide()
