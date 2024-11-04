extends Node2D

@export var enemy : PackedScene
@export var enemyRoll : PackedScene
@onready var timer = $Settings/Timer

var elapsed_time = 0.0
var min_wait_time = 0.1
var max_wait_time = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GLOBAL.score = 0
	GLOBAL.credits = 1
	timer.timeout.connect(_on_timer_timeout)
	# Set initial random timeout
	timer.wait_time = randf_range(0.1, 1.0)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	elapsed_time += delta
	parallax_bg(delta)
	# Increase the speed of PathFollow2D
	$PathSpawn/PathFollow2D.set_progress($PathSpawn/PathFollow2D.get_progress() + 160 * delta)

func parallax_bg(delta_time) -> void:
	get_node("Background/Back").scroll_base_offset -= Vector2(32, 0) * delta_time * 0.60
	$Background/Stars.scroll_base_offset -= Vector2(32, 0) * delta_time * 0.75
	$Background/Planet_big.scroll_base_offset -= Vector2(1, 0) * delta_time * 40
	$Background/Planet_small.scroll_base_offset -= Vector2(1, 0) * delta_time * 30
	$Background/Planet_mini.scroll_base_offset -= Vector2(1, 0) * delta_time * 24

func _on_timer_timeout() -> void:
	var enemy_instance
	if randf() < 0.6:
		enemy_instance = enemy.instantiate()
		enemy_instance.global_position = $PathSpawn/PathFollow2D.global_position
		var random_rotation = randf_range(deg_to_rad(-359), deg_to_rad(359))
		enemy_instance.rotation = random_rotation

		var random_rotation_speed = randf_range(0.5, 2.0)
		enemy_instance.rotation_speed = random_rotation_speed
	else:
		enemy_instance = enemyRoll.instantiate()
		enemy_instance.global_position = $PathSpawn/PathFollow2D.global_position
		var random_rotation = randf_range(deg_to_rad(-10), deg_to_rad(10))
		enemy_instance.rotation = random_rotation

	add_child(enemy_instance)
	# Set new random timeout
	var new_wait_time = max_wait_time - (elapsed_time / 100.0)
	timer.wait_time = clamp(new_wait_time, min_wait_time, max_wait_time)
	timer.start()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()