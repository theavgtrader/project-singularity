class_name PrototypeHUD
extends Control
## Code-drawn HUD keeps the first build independent of external UI assets.

var _location := "THE UNDERCITY"
var _hint := ""
var _interaction_prompt := ""
var _message := ""
var _message_timer := 0.0


func _ready() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE


func set_location(value: String) -> void:
	_location = value
	queue_redraw()


func set_hint(value: String) -> void:
	_hint = value
	queue_redraw()


func set_interaction_prompt(value: String) -> void:
	if _interaction_prompt == value:
		return
	_interaction_prompt = value
	queue_redraw()


func show_message(value: String) -> void:
	_message = value
	_message_timer = 6.0
	queue_redraw()


func _process(delta: float) -> void:
	if _message_timer > 0.0:
		_message_timer -= delta
		if _message_timer <= 0.0:
			_message = ""
			queue_redraw()


func _draw() -> void:
	var font: Font = ThemeDB.fallback_font

	# Location plate.
	draw_rect(Rect2(6, 6, 166, 24), Color("#080e19"))
	draw_rect(Rect2(6, 6, 166, 1), Color("#16c5cf"))
	draw_rect(Rect2(6, 29, 166, 1), Color("#33475a"))
	draw_string(font, Vector2(12, 17), "PROJECT: SINGULARITY", HORIZONTAL_ALIGNMENT_LEFT, -1, 8, Color("#e4f4f5"))
	draw_string(font, Vector2(12, 26), _location, HORIZONTAL_ALIGNMENT_LEFT, -1, 6, Color("#8ba7b9"))

	# Compact status panel.
	draw_rect(Rect2(250, 6, 64, 24), Color("#080e19"))
	draw_rect(Rect2(250, 6, 64, 1), Color("#d95cbb"))
	draw_string(font, Vector2(256, 17), "SYNC  04%", HORIZONTAL_ALIGNMENT_LEFT, -1, 7, Color("#d9c9ed"))
	draw_rect(Rect2(256, 21, 50, 3), Color("#202c3e"))
	draw_rect(Rect2(256, 21, 18, 3), Color("#d95cbb"))

	# Controls hint.
	draw_rect(Rect2(6, 157, 174, 16), Color("#080e19"))
	draw_string(font, Vector2(11, 168), _hint, HORIZONTAL_ALIGNMENT_LEFT, 166, 6, Color("#91a6b6"))

	if not _interaction_prompt.is_empty():
		draw_rect(Rect2(77, 137, 166, 13), Color("#091522"))
		draw_rect(Rect2(77, 137, 166, 1), Color("#16c5cf"))
		draw_string(font, Vector2(84, 147), _interaction_prompt, HORIZONTAL_ALIGNMENT_LEFT, 152, 7, Color("#d6f5f2"))

	if not _message.is_empty():
		draw_rect(Rect2(28, 108, 264, 48), Color("#080e19"))
		draw_rect(Rect2(28, 108, 264, 1), Color("#d95cbb"))
		draw_rect(Rect2(28, 155, 264, 1), Color("#33475a"))

		var lines := _message.split("\n")
		for index in range(mini(lines.size(), 3)):
			draw_string(font, Vector2(36, 122 + index * 11), lines[index], HORIZONTAL_ALIGNMENT_LEFT, 248, 7, Color("#dce8f0"))
