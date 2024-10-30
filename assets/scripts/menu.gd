extends Control

@onready var _animated_sprite = $PlanetSprite
@onready var _audio_player = $MenuMusic

# func to start the animation of the menu when start the game
func _ready():
	_animated_sprite.play("rotationPlanet")
	_audio_player.play()
	
func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()