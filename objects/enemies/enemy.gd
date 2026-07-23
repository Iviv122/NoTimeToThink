@abstract
extends CharacterBody2D
class_name Enemy

@export_category("stats")
@export var health : float = 3
@export var speed : float = 250

@export_category("targeting/ai")
@export var player_pos : PlayerPos

@export_category("misc")
@export var projectile : PackedScene
@export var death_particle : PackedScene
# misc

@abstract func on_damage(amount : float) -> void
@abstract func on_death() -> void

func death_effect() -> void:
	if !death_particle:
		return
	var eff = death_particle.instantiate() as GPUParticles2D

	eff.global_position = global_position
	eff.restart()

	get_tree().root.add_child(eff)

func damage(amount : float) -> void:
	health -= amount
	if health <= 0:
		die()
	on_damage(amount)

func die() -> void:
	death_effect()
	on_death()
	queue_free()
