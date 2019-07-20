extends Node

onready var timer = get_node("Timer")
onready var spawn = timer.get_children()
onready var fireball = preload("res://scenes/greenFireBall.tscn")

func _ready():
	timer.start()
	
func _on_Timer_timeout():
	# first randomize the spawn point, then spawn a fireball.
	randomize()
	spawn[randi() % spawn.size()].add_child(fireball.instance())
	
