extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()

func _physics_process(delta):
	motion.y += 20
	
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		motion.x = 170
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		motion.x = -170
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("idle")

	if is_on_floor():
		if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
			motion.y = -520
	
	motion = move_and_slide(motion, UP)
