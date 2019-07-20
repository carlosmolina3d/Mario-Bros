extends KinematicBody2D

onready var ray = get_node('ray')
onready var sprite = get_node('sprite')
onready var screen = get_viewport_rect().size.x
#onready var pos = get_pos()

const ACCEL = 1500
const MAX_SPEED = 500
const FRICTION = -500
const GRAVITY = 4000
const JUMP = -1250

var acc = Vector2()
var vel = Vector2()
var jumping = false

func _ready():
	pass

func _input(event):
	if ray.is_colliding():
		if Input.is_action_pressed("ui_accept"):
			jumping = true
			vel.y = JUMP
		
	if event.is_action_pressed("ui_right"):
		sprite.play('walk')
		sprite.set_flip_h(true)
		
	if event.is_action_pressed("ui_left"):
		sprite.play('walk')
		sprite.set_flip_h(false)

func _fixed_process(delta):

	acc.y = GRAVITY
	
#	acc.x = Input.is_action_pressed("ui_right") - Input.is_action_pressed("ui_left")
	
	acc.x *= ACCEL
	
	if acc.x == 0:
		sprite.stop()
		acc.x = vel.x * FRICTION * delta
		
	vel += acc * delta
	
	# slows acceleration down
	vel.x = clamp(vel.x, -MAX_SPEED, MAX_SPEED)

	var motion = move_and_slide(vel * delta)
	
	if is_on_floor():
		var n = get_collision_normal()
		motion = n.slide(motion)
		vel = n.slide(vel)
		jumping = false
		move_and_slide(motion)