extends Node2D

const SPEED = 60

@onready var explosion : bool = false

func _process(delta) -> void:
	match explosion:
		false: 
			global_position.x -= SPEED * delta

func explosion_ctrl() -> void:
	explosion = true
	$Area2D.queue_free()
	$Explosion.play("Explosion")
	$Explosion/Audio.play()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_area_2d_body_entered(body) -> void:
	if body is Player:
		explosion_ctrl()
		body.queue_free()
		GLOBAL.credits -= 1

func _on_area_2d_area_entered(area) -> void:
	if area.is_in_group("Shot"):
		explosion_ctrl()
		GLOBAL.score += 100

func _on_audio_finished() -> void:
	queue_free()

	if GLOBAL.credits <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
