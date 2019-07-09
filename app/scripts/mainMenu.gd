extends Control

# Number of players
onready var easy = $ gameMenu/easy/a
onready var hard = $ gameMenu/hard/b
onready var twoEasy = $ gameMenu/twoEasy/a
onready var twoHard = $ gameMenu/twoHard/b
onready var demo = $demoTimer
onready var score = $info/score

var index = 0
var gameModes
var gameModesMax

# Called when the node enters the scene tree for the first time.
func _ready():
	# show the high score, sprite for a single player easy game, start the demo timer.
	score.text = "Hi Score: " + str(global.hiScore)
	gameModes = [easy, hard, twoEasy, twoHard]
	gameModes[index].visible = true
	gameModesMax = gameModes.size() - 1
	demo.start(8)	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed('enter'):
			# load the selected game mode
			if gameModes[index] == easy:
				global.goto_scene("res://scenes/oneA.tscn")
			if gameModes[index] == hard:
				global.goto_scene("res://scenes/oneB.tscn")
			if gameModes[index] == twoEasy:
				global.goto_scene("res://scenes/twoA.tscn")
			if gameModes[index] == twoHard:
				global.goto_scene("res://scenes/twoB.tscn")
			
	if Input.is_action_just_pressed('up'):
		# Array top limit.
		
		demo.start(8)
		if index - 1 <= -1:
			pass
		else:
			# hide current sprite
			gameModes[index].visible = false
			# Move selection up one
			index -= 1
			# show new sprite
			gameModes[index].visible = true
		
	if Input.is_action_just_pressed('down'):
		# Array bottom limit
		
		demo.start(8)
		if index + 1 > gameModesMax:
			pass
		else:
			# hide current sprite
			gameModes[index].visible = false
			# Move selection down one
			index += 1
			# show new sprite
			gameModes[index].visible = true


#get_tree().quit()


# methods

func playDemo():
	# TODO
	print("Load demo")
	get_tree().reload_current_scene()

# signals

func _on_easy_mouse_entered():
	# dosent work
	print("entering")

func _on_easy_mouse_exited():
	# dosent work
	print("leaving")

func _on_demoTimer_timeout():
	playDemo()
