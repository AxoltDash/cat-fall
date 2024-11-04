extends Control

@onready var _animation_player = $AnimationPlayer
@onready var _animated_sprite = $PlanetSprite
@onready var _audio_player = $XDDDmusic

func _ready():
	_animation_player.play("fade_out")
	_animated_sprite.play("rotationPlanet")
	_audio_player.play()
	
func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
