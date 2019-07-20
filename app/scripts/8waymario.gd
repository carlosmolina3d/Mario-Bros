extends KinematicBody2D

onready var sprite = get_node('sprite')
onready var screen = get_viewport_rect().size

func _ready():
	set_process(true)

func _process(delta):
	# get player input, velocity, move player
	var input = input()
	var velocity = movement(delta, input)
	move(velocity)
	
func input():
	# -> Vector 2
	# update the positon after the direction changes
	var dir = Vector2()
	var pos = get_pos()
	
	if Input.is_action_pressed("ui_right"):
		if pos.x > screen.x:
			move_to(Vector2(0,pos.y))
		dir.x += 1
		sprite.play('walk')
		sprite.set_flip_h(true)
		
	elif Input.is_action_pressed("ui_left"):
		if pos.x < 0:
			move_to(Vector2(screen.x, pos.y))
		dir.x -= 1
		sprite.play('walk')
		sprite.set_flip_h(false)
		
	elif Input.is_action_pressed("ui_up"):
		if pos.y < 0:
			move_to(Vector2(pos.x, screen.y))
		dir.y -= 1
	elif Input.is_action_pressed("ui_down"):
		if pos.y > screen.y:
			move_to(Vector2(pos.x, 0))
		dir.y += 1
	else:
		# dir.x = 0
		# sprite.play("idle")
		sprite.stop()
	return dir
	
func movement(delta, input, speed=500):
	# -> Vector2
	var velocity = input * speed * delta
	return velocity
