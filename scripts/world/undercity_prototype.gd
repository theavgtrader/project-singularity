class_name UndercityPrototype
extends Node2D
## Static, code-drawn placeholder environment. Replace selectively with licensed tilesets later.

const MAP_SIZE := Vector2(640.0, 360.0)
const TILE_SIZE := 16

const INTERACTIONS := [
	{
		"id": "mira",
		"position": Vector2(112.0, 176.0),
		"prompt": "E  //  SPEAK TO MIRA",
		"message": "MIRA // COURIER\nTransit is sealed. Something got loose beneath the old line."
	},
	{
		"id": "terminal",
		"position": Vector2(246.0, 190.0),
		"prompt": "E  //  ACCESS TERMINAL",
		"message": "NODE UDC-07 // DEGRADED\nA signal pulses beneath the static. Its handshake predates the city network."
	}
]

const INTERACTION_RANGE := 22.0


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, MAP_SIZE), Color("#101725"))

	# Quiet 16 px floor pattern keeps the scene readable without a texture atlas.
	for x in range(0, int(MAP_SIZE.x), TILE_SIZE):
		for y in range(0, int(MAP_SIZE.y), TILE_SIZE):
			var tile_index := int(x / TILE_SIZE) + int(y / TILE_SIZE)
			var floor_color := Color("#141e2c") if tile_index % 2 == 0 else Color("#172231")
			draw_rect(Rect2(x, y, TILE_SIZE, TILE_SIZE), floor_color)

	# Building masses frame the main street.
	_draw_building(Rect2(14, 14, 118, 88), Color("#202b3a"), Color("#16c5cf"), "K-LOW")
	_draw_building(Rect2(145, 12, 120, 90), Color("#252b3b"), Color("#d95cbb"), "SYNTH 24")
	_draw_building(Rect2(278, 16, 142, 86), Color("#1e2a38"), Color("#e58b55"), "REPAIR")
	_draw_building(Rect2(432, 12, 190, 90), Color("#20283b"), Color("#5c8fe3"), "TRANSIT")

	_draw_building(Rect2(12, 268, 152, 82), Color("#202a38"), Color("#d95cbb"), "NIGHT MARKET")
	_draw_building(Rect2(182, 270, 130, 80), Color("#252d39"), Color("#16c5cf"), "GRID 07")
	_draw_building(Rect2(330, 266, 170, 84), Color("#1e2a38"), Color("#e58b55"), "SALVAGE")
	_draw_building(Rect2(512, 268, 116, 82), Color("#20283b"), Color("#5c8fe3"), "LIFT 03")

	# Walkways, kerbs, storm drains, and the wet central road.
	draw_rect(Rect2(0, 104, 640, 12), Color("#293443"))
	draw_rect(Rect2(0, 116, 640, 140), Color("#111a28"))
	draw_rect(Rect2(0, 256, 640, 12), Color("#293443"))
	draw_line(Vector2(0, 116), Vector2(640, 116), Color("#536071"), 1.0)
	draw_line(Vector2(0, 255), Vector2(640, 255), Color("#536071"), 1.0)

	for x in range(18, 640, 48):
		draw_rect(Rect2(x, 181, 21, 2), Color("#59616b"))
		draw_rect(Rect2(x + 2, 184, 17, 1), Color("#283342"))

	# Grates and service access panels.
	for grate_x in [42, 294, 526]:
		draw_rect(Rect2(grate_x, 242, 22, 7), Color("#080e18"))
		for line_x in range(grate_x + 3, grate_x + 20, 4):
			draw_line(Vector2(line_x, 243), Vector2(line_x, 248), Color("#596a78"), 1.0)

	# Puddles reflect local neon colours.
	_draw_puddle(Vector2(72, 145), Vector2(28, 7), Color("#23546a"))
	_draw_puddle(Vector2(194, 226), Vector2(38, 8), Color("#58305f"))
	_draw_puddle(Vector2(278, 137), Vector2(20, 5), Color("#28566a"))
	_draw_puddle(Vector2(358, 220), Vector2(42, 7), Color("#63413f"))

	# Small props and a drain-side terminal.
	_draw_terminal(Vector2(246, 190))
	_draw_npc(Vector2(112, 176), Color("#d95cbb"))
	_draw_sign_glow(Rect2(25, 91, 66, 3), Color("#16c5cf"))
	_draw_sign_glow(Rect2(157, 96, 58, 3), Color("#d95cbb"))
	_draw_sign_glow(Rect2(292, 96, 68, 3), Color("#e58b55"))

	# A subtle sector label in the environment.
	draw_string(ThemeDB.fallback_font, Vector2(12, 128), "LOWER TRANSIT  /  BAY 03", HORIZONTAL_ALIGNMENT_LEFT, -1, 7, Color("#71899a"))


func get_nearby_interaction(world_position: Vector2) -> Dictionary:
	var closest: Dictionary = {}
	var closest_distance := INTERACTION_RANGE

	for interaction in INTERACTIONS:
		var distance: float = world_position.distance_to(interaction["position"])
		if distance <= closest_distance:
			closest_distance = distance
			closest = interaction

	return closest


func _draw_building(rect: Rect2, wall_color: Color, accent: Color, label: String) -> void:
	draw_rect(Rect2(rect.position + Vector2(3, 4), rect.size), Color("#080d17"))
	draw_rect(rect, wall_color)
	draw_rect(Rect2(rect.position, Vector2(rect.size.x, 6)), accent)
	draw_rect(Rect2(rect.position + Vector2(4, 8), Vector2(rect.size.x - 8, 2)), Color("#0b1320"))

	var columns := maxi(2, int(rect.size.x / 22.0) - 1)
	for row in range(2):
		for column in range(columns):
			var window_position := rect.position + Vector2(8 + column * 18, 18 + row * 22)
			var window_color := Color("#33556a") if (column + row) % 3 == 0 else Color("#283b53")
			draw_rect(Rect2(window_position, Vector2(8, 9)), Color("#0a1220"))
			draw_rect(Rect2(window_position + Vector2(1, 1), Vector2(6, 7)), window_color)

	draw_rect(Rect2(rect.position + Vector2(7, rect.size.y - 15), Vector2(rect.size.x - 14, 10)), Color("#101725"))
	draw_string(ThemeDB.fallback_font, rect.position + Vector2(10, rect.size.y - 7), label, HORIZONTAL_ALIGNMENT_LEFT, -1, 7, accent)


func _draw_puddle(center: Vector2, size: Vector2, tint: Color) -> void:
	draw_rect(Rect2(center - size * 0.5, size), Color("#0b1421"))
	draw_rect(Rect2(center - Vector2(size.x * 0.35, 1.0), Vector2(size.x * 0.5, 1.0)), tint)


func _draw_sign_glow(rect: Rect2, tint: Color) -> void:
	draw_rect(Rect2(rect.position - Vector2(1, 1), rect.size + Vector2(2, 2)), Color(tint.r, tint.g, tint.b, 0.18))
	draw_rect(rect, tint)


func _draw_terminal(center: Vector2) -> void:
	draw_rect(Rect2(center + Vector2(-7, 2), Vector2(14, 7)), Color("#080d17"))
	draw_rect(Rect2(center + Vector2(-6, -8), Vector2(12, 11)), Color("#303849"))
	draw_rect(Rect2(center + Vector2(-4, -6), Vector2(8, 6)), Color("#0c2638"))
	draw_rect(Rect2(center + Vector2(-3, -5), Vector2(6, 1)), Color("#16c5cf"))
	draw_rect(Rect2(center + Vector2(-2, -2), Vector2(4, 1)), Color("#5c8fe3"))
	draw_rect(Rect2(center + Vector2(-1, 3), Vector2(2, 5)), Color("#657587"))


func _draw_npc(center: Vector2, accent: Color) -> void:
	draw_rect(Rect2(center + Vector2(-5, 5), Vector2(10, 3)), Color("#080d17"))
	draw_rect(Rect2(center + Vector2(-4, -2), Vector2(8, 9)), Color("#39495d"))
	draw_rect(Rect2(center + Vector2(-5, 0), Vector2(10, 5)), accent)
	draw_rect(Rect2(center + Vector2(-3, -9), Vector2(6, 7)), Color("#c99579"))
	draw_rect(Rect2(center + Vector2(-4, -10), Vector2(8, 3)), Color("#292536"))
	draw_rect(Rect2(center + Vector2(-2, -5), Vector2(1, 1)), Color("#121a28"))
	draw_rect(Rect2(center + Vector2(1, -5), Vector2(1, 1)), Color("#121a28"))
