extends CharacterBody2D

var fall_speed: float = 200.0
var rotation_speed: float = 180.0  # Degrees per second

func _ready():
    # Start falling
    pass

func _process(delta):
    # Move the cat downwards
    position.y += fall_speed * delta

func _input(event):
    if event is InputEventMouseButton and event.is_pressed() and is_in_group("clickable"):
        rotate_cat()

func rotate_cat():
    rotation += rotation_speed * (1.0 / 60.0)  # Rotate the cat

