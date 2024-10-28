extends CharacterBody2D
class_name Player

@export var shot : PackedScene
@onready var screensize : get_viewport_rect().size

const SPEED = 80

fun _process(_delta)
	anim_ctrl()
	motion_ctrl()

func _input(event)
	if event.id_action_pressed("ui_accept")
		shoot_ctrl()

func anim_ctrl() -> void:
	if GLOBAL.get_axis().y > 0:
		$Spaceship.animation = "Up"
	elif GLOBAL.get_axis().y < 0:
		$Spaceship.animation = "Down"
	else:
		$Spaceship.animation = "Idle"

func motion_ctrl()

