extends Area2D

onready var fireBall = $fireBall

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	#test spin on enter
	fireBall.play("spin")
	# enable collision for self
	#connect("area_enter", self, "_on_Area2D_body_enter")
	

#func _on_Area2D_body_enter():
#	fireBall.stop()
#	fireBall.play("vanish")

func _on_fireBallGreen_area_entered(area):
	fireBall.stop()
	fireBall.play("vanish")
