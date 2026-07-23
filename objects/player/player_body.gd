extends CharacterBody2D
class_name PlayerBody

@export_category("base_movement")
@export var speed : float = 150
@export_category("dash")
@export var dash : float = 200
@export var dash_duration : float = 0.4
@export var dash_cooldown : float = 1
@export var dash_modifier : float = 2.5

@export_category("misc")
@export var player_pos : PlayerPos

var dir : Vector2 = Vector2.ZERO
var state : State

var _dash_time : float = 0
var _dash_cooldown : float = 0

func _ready() -> void:
	player_pos.player = self

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("dash"):
		_dash()

func _dash() -> void:
	if _dash_cooldown <= 0 && !dir.is_zero_approx():
		_dash_time = dash_duration
		_dash_cooldown = dash_cooldown

func handle_state() -> void:
	if _dash_time > 0:
		state = State.Dash
	elif dir.is_zero_approx():
		state = State.Idle
	else:
		state = State.Walking


func _physics_process(_delta: float) -> void:

	_dash_time -= _delta
	_dash_cooldown -= _delta

	if state != State.Dash:
		dir = Vector2.ZERO
		dir.x = Input.get_axis("left","right")
		dir.y = Input.get_axis("up","down")
		velocity = dir.normalized()*speed
	else:
		velocity = dir*dash_modifier*speed

	handle_state()
	move_and_slide()

enum State{
	Idle,
	Walking,
	Dash
}
