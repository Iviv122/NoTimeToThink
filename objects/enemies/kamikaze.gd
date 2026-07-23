extends Enemy
class_name Kamikaze

@export var radius : float = 250

func on_damage(_amount : float) -> void:
	pass
func on_death() -> void:
	pass

func explode() -> void:
	die()

func _process(_delta: float) -> void:

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is PlayerBody:
			explode()

	var dir = (player_pos.player.global_position - global_position).normalized()
	velocity = dir*speed
	move_and_slide()
