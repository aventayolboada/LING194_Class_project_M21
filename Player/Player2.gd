extends KinematicBody2D

export var speed = 200
var screen_size
var target = Vector2()
var clickmovemode = false
var velocity = Vector2()

func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite.play()
	
func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		clickmovemode = true
		velocity = position.direction_to(target) * speed
	if event.is_action_pressed("c"):
		$Fanfare.play()
		
func _process(delta):
	if position.distance_to(target) > 5 and clickmovemode == true:
		velocity = move_and_slide(velocity.normalized())
	else:
		velocity.x = 0
		velocity.y = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		clickmovemode = false
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		clickmovemode = false
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		clickmovemode = false
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		clickmovemode = false
	if Input.is_action_pressed("ui_select"):
		speed = 400
	else:
		speed = 200
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		if speed < 300:
			$AnimatedSprite.animation = "walk"
		if speed > 300:
			$AnimatedSprite.animation = "run"
	else:
		if Input.is_action_pressed("c"):
			$AnimatedSprite.animation = "jump"
			get_tree().set_group("CelebrateFireworksParticles", "emitting", true)
			if $FireworkSounds.playing == false:
				$FireworkSounds.playing = true
		else:
			$AnimatedSprite.animation = "idle"
			get_tree().set_group("CelebrateFireworksParticles", "emitting", false)
			$FireworkSounds.stop()
			$Fanfare.playing = false
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	if velocity.x != 0:
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0

	
