extends CharacterBody2D
## Lightweight player controller for the first playable prototype.

const MOVE_SPEED := 66.0
const WORLD_BOUNDS := Rect2(10.0, 10.0, 620.0, 340.0)

var _last_direction := Vector2.DOWN
var _walk_clock := 0.0
var _walk_frame := 0


func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO

	if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
		direction.x -= 1.0
	if Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
		direction.x += 1.0
	if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP):
		direction.y -= 1.0
	if Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN):
		direction.y += 1.0

	if direction.length_squared() > 1.0:
		direction = direction.normalized()

	if direction != Vector2.ZERO:
		_last_direction = direction
		velocity = direction * MOVE_SPEED
		_walk_clock += delta
		var next_frame := int(_walk_clock * 8.0) % 2
		if next_frame != _walk_frame:
			_walk_frame = next_frame
			queue_redraw()
	else:
		velocity = Vector2.ZERO
		_walk_clock = 0.0
		if _walk_frame != 0:
			_walk_frame = 0
			queue_redraw()

	move_and_slide()

	global_position.x = clampf(global_position.x, WORLD_BOUNDS.position.x, WORLD_BOUNDS.end.x)
	global_position.y = clampf(global_position.y, WORLD_BOUNDS.position.y, WORLD_BOUNDS.end.y)


func _draw() -> void:
	# Shadow and compact, deliberately provisional pixel-art silhouette.
	draw_rect(Rect2(-6.0, 3.0, 12.0, 4.0), Color("#080b13"))
	draw_rect(Rect2(-4.0, -1.0, 8.0, 10.0), Color("#26364d"))
	draw_rect(Rect2(-5.0, 0.0, 10.0, 6.0), Color("#3b5871"))
	draw_rect(Rect2(-4.0, -8.0, 8.0, 8.0), Color("#d5a889"))
	draw_rect(Rect2(-4.0, -9.0, 8.0, 3.0), Color("#252333"))
	draw_rect(Rect2(-5.0, -7.0, 3.0, 4.0), Color("#252333"))

	if _last_direction.y < -0.45:
		draw_rect(Rect2(-4.0, -8.0, 8.0, 8.0), Color("#252333"))
		draw_rect(Rect2(-4.0, -4.0, 8.0, 5.0), Color("#26364d"))
	elif absf(_last_direction.x) > 0.45:
		var face_x := 2.0 if _last_direction.x > 0.0 else -4.0
		draw_rect(Rect2(face_x, -6.0, 2.0, 2.0), Color("#f3d6a5"))

	var leg_offset := 1.0 if _walk_frame == 1 else 0.0
	draw_rect(Rect2(-3.0, 7.0, 2.0, 4.0 + leg_offset), Color("#111a2a"))
	draw_rect(Rect2(1.0, 7.0 - leg_offset, 2.0, 4.0 + leg_offset), Color("#111a2a"))
	draw_rect(Rect2(-4.0, 10.0 + leg_offset, 3.0, 1.0), Color("#e4a35e"))
	draw_rect(Rect2(1.0, 10.0, 3.0, 1.0), Color("#e4a35e"))
