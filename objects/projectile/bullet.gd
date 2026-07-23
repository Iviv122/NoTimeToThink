extends Projectile
class_name Bullet

func hit(body : Node2D) -> void:
	if body is Enemy:
		body.damage(parent_gun.damage)

# nothing
func timer_end() -> void:
	pass
