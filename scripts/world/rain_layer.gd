extends Node2D
## Sparse animated rain. Kept separate so the static world is not redrawn every frame.

const MAP_WIDTH := 640
const MAP_HEIGHT := 360
const DROP_COUNT := 38
const REDRAW_INTERVAL := 0.10

var _rng := RandomNumberGenerator.new()
var _drops: Array[Vector2] = []
var _redraw_clock := 0.0


func _ready() -> void:
	_rng.seed = 70402
	for index in range(DROP_COUNT):
		_drops.append(Vector2(
			_rng.randi_range(0, MAP_WIDTH),
			_rng.randi_range(0, MAP_HEIGHT)
		))


func _process(delta: float) -> void:
	for index in range(_drops.size()):
		var drop := _drops[index]
		drop.x -= 13.0 * delta
		drop.y += 46.0 * delta

		if drop.y > MAP_HEIGHT:
			drop.y = -4.0
			drop.x = _rng.randi_range(0, MAP_WIDTH)

		if drop.x < 0.0:
			drop.x = MAP_WIDTH

		_drops[index] = drop

	_redraw_clock += delta
	if _redraw_clock >= REDRAW_INTERVAL:
		_redraw_clock = 0.0
		queue_redraw()


func _draw() -> void:
	for drop in _drops:
		draw_line(drop, drop + Vector2(-1, 3), Color("#547b9a"), 1.0, false)
