extends Gun
class_name PlayerMortar

@export var radius : float = 64
@export var fly_time : float = 2

func shoot(init_pos : Vector2,end_point : Vector2,scene : SceneTree) -> void:
	var _projectile = projectile.instantiate() as MortarProjectile

	_projectile.detonate_time = fly_time
	_projectile.radius = radius
	_projectile.begin = init_pos
	_projectile.end = end_point

	_projectile.parent_weapon = self

	scene.root.add_child(_projectile)
