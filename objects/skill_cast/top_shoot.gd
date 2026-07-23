class_name MortarProjectile
extends Area2D

var parent_weapon : Gun

@export_category("misc")
@export var pre_particle : Sprite2D
@export var bomb : Sprite2D

@export_category("pos")
@export var begin : Vector2
@export var end : Vector2

@export_category("explosion")
@export var radius : float
@export var radius_texture : float
@export var detonate_time : float

func _ready() -> void:
	scale *= radius/radius_texture
	global_position = end
	explode_pre_effect()
	bomb_anim()
	await get_tree().create_timer(detonate_time).timeout
	explode()

func explode_pre_effect() -> void:
	pre_particle.global_position = end
	pre_particle.modulate.a = 0
	var t := create_tween()
	t.tween_property(pre_particle,"modulate:a",0.8,detonate_time)


func bomb_anim() -> void:
	var height := 250.0

	var tween := create_tween()
	tween.tween_method(
		func(t: float):
			var pos = begin.lerp(end, t)
			pos.y -= 4.0 * height * t * (1.0 - t)
			bomb.global_position = pos,
		0.0,
		1.0,
		detonate_time
	)

func explode() -> void:
	for i in get_overlapping_bodies():
			if i is Enemy:
				i.damage(3)

	queue_free()
