extends Node2D
## Coordinates the first Undercity prototype without owning gameplay systems.

@onready var world: UndercityPrototype = $Undercity
@onready var player: CharacterBody2D = $Player
@onready var hud: PrototypeHUD = $HUD/Overlay

var _interact_was_pressed := false
var _escape_was_pressed := false


func _ready() -> void:
	var camera := $Player/Camera2D as Camera2D
	camera.limit_left = 0
	camera.limit_top = 0
	camera.limit_right = 640
	camera.limit_bottom = 360
	camera.position_smoothing_enabled = false

	hud.set_location("THE UNDERCITY  /  SECTOR 07")
	hud.set_hint("MOVE: WASD / ARROWS     USE: E")


func _process(_delta: float) -> void:
	var nearby: Dictionary = world.get_nearby_interaction(player.global_position)
	hud.set_interaction_prompt(String(nearby.get("prompt", "")))

	var interact_pressed := Input.is_key_pressed(KEY_E)
	if interact_pressed and not _interact_was_pressed and not nearby.is_empty():
		hud.show_message(String(nearby.get("message", "")))
	_interact_was_pressed = interact_pressed

	var escape_pressed := Input.is_key_pressed(KEY_ESCAPE)
	if escape_pressed and not _escape_was_pressed:
		hud.show_message("CONTROLS  //  WASD OR ARROWS TO MOVE.  E TO INTERACT.")
	_escape_was_pressed = escape_pressed
