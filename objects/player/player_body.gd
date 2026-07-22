extends CharacterBody2D
class_name PlayerBody

@export var speed : float = 150
@export var dash : float = 200
var dir : Vector2 = Vector2.ZERO


func _dash() -> void:
	pass

func _physics_process(_delta: float) -> void:
	dir = Vector2.ZERO

	dir.x = Input.get_axis("left","right")
	dir.y = Input.get_axis("up","down")

	velocity = dir.normalized()*speed
	move_and_slide()
