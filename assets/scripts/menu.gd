extends Control

@onready var _animated_sprite = $PlanetSprite

# func to start the animation of the menu when start the game
func _ready():
	_animated_sprite.play("rotationPlanet")
	
func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level.tscn")
