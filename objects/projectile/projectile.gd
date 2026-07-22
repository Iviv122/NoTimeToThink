@abstract
extends Area2D
class_name Projectile

@export var speed : float
@export var timer : float = 3

var parent_gun : Gun
var dir : Vector2
var _timer : float

@abstract func hit(body : Node2D) -> void
@abstract func timer_end() -> void

func _ready() -> void:
	body_entered.connect(hit)


func _process(delta: float) -> void:
	_timer -= delta
	if _timer <= 0:
		timer_end()
		queue_free()
	global_position += dir*speed*delta
