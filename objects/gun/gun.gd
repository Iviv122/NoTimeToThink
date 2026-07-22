@abstract
class_name Gun
# because we need to create before hand
extends Resource

@export_category("stats")
#@export var mag_size
@export var damage : float = 1
# attack_second
@export var attack_speed : float = 1

@export_category("graphics")
@export var muzzle_point_offset : Vector2
@export var sprite : Texture2D

@export_category("misc")
@export var projectile : PackedScene


# muzzle point to mouse coursor/raycast collision
@abstract func shoot(init_pos : Vector2,end_pos : Vector2) -> void
