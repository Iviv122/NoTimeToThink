extends Gun
class_name PistolGun


func shoot(init_pos : Vector2,end_point : Vector2,scene : SceneTree) -> void:
	var _projectile = projectile.instantiate() as Projectile

	var projectile_init_pos = init_pos + muzzle_point_offset
	var dir = (end_point - init_pos).normalized()

	_projectile.global_position = projectile_init_pos
	_projectile.rotation = atan2(dir.y,dir.x)
	_projectile.dir = dir
	_projectile.parent_gun = self

	scene.root.add_child(_projectile)
