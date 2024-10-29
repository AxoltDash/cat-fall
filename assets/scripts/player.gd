extends CharacterBody2D
class_name Player

@export var shot : PackedScene
@onready var screensize = get_viewport_rect().size

const SPEED = 80

func _process(_delta):
	anim_ctrl()
	motion_ctrl()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		shoot_ctrl()

func anim_ctrl() -> void:
	if GLOBAL.get_axis().y > 0:
		$Spaceship.animation = "Up"
	elif GLOBAL.get_axis().y < 0:
		$Spaceship.animation = "Down"
	else:
		$Spaceship.animation = "Idle"

func motion_ctrl() -> void:
	velocity.x = GLOBAL.get_axis().x * SPEED
	velocity.y = GLOBAL.get_axis().y * SPEED
	move_and_slide()

	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

func shoot_ctrl() -> void:
	$Flash.play("Flash")
	$Settings/AudioShot.play()
	
	var shot_instance = shot.instance()
	shot_instance.global_position = $ShootSpawn.global_position
	get_tree().call_group("Level", "add_child", shot_instance)
