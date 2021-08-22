extends KinematicBody2D

export var speed = 200
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite.play()

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1	
	if Input.is_action_pressed("ui_select"):
		speed = 400
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		if speed < 300:
			$AnimatedSprite.animation = "walk"
		if speed > 300:
			$AnimatedSprite.animation = "run"
	else:
		$AnimatedSprite.animation = "idle"
		speed = 200
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	if velocity.x != 0:
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0

	
