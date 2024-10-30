extends Node2D
@export var enemy : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GLOBAL.score = 0
	GLOBAL.credits = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	parallax_bg(delta)
	$PathSpawn/PathFollow2D.set_progress($PathSpawn/PathFollow2D.get_progress() + 80 * delta)

func parallax_bg(delta_time) -> void:
	get_node("Background/Back").scroll_base_offset -= Vector2(32, 0) * delta_time * 0.60
	$Background/Stars.scroll_base_offset -= Vector2(32, 0) * delta_time * 0.75
	$Background/Planet_big.scroll_base_offset -= Vector2(1, 0) * delta_time * 40
	$Background/Planet_small.scroll_base_offset -= Vector2(1, 0) * delta_time * 30
	$Background/Planet_mini.scroll_base_offset -= Vector2(1, 0) * delta_time * 24

func _on_timer_timeout() -> void:
	var enemy_instance = enemy.instantiate()
	enemy_instance.global_position = $PathSpawn/PathFollow2D.global_position
	add_child(enemy_instance)
