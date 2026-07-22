extends Node2D
class_name Shooter

@export var player_body : PlayerBody
@export var offset : float = 40
@export var current_gun : Gun

var dir : Vector2

func _process(_delta: float) -> void:

	dir = get_global_mouse_position() - player_body.global_position

	if is_zero_approx(dir.length()):
		dir = Vector2.RIGHT
	else:
		dir = dir.normalized()
	global_position = player_body.global_position + dir*offset
	rotation = dir.angle()


func shoot() -> void:
	pass
