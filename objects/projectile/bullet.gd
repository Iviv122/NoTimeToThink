extends Projectile
class_name Bullet

@export var destroy_on_hit : bool = true

func hit(body : Node2D) -> void:
	if body is Enemy:
		body.damage(parent_gun.damage)
	elif body is PlayerBody:
		return;

	if destroy_on_hit:
		queue_free()

# nothing
func timer_end() -> void:
	pass
