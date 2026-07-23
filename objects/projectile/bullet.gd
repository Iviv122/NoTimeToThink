extends Projectile
class_name Bullet

func hit(body : Node2D) -> void:
	if body is Enemy:
		body.damage(parent_gun.damage)
	elif body is PlayerBody:
		return;
	queue_free()

# nothing
func timer_end() -> void:
	pass
