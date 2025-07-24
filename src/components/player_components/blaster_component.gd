extends Node2D
class_name BlasterComponent

func _physics_process(delta) -> void:
	return

func blast():
	# Needs to get the input of the player and use that to blast. 
	# maybe... we run this in the _physics_process with something to
	# check for input?
	#
	# 
	print("Blast!")
	return

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("bang_input"):
		print("Bang!")
