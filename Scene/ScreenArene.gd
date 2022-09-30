extends Node2D


onready var camera = $Camera2D

func _process(_delta):
	if Input.is_action_just_released("MolletUp"):
		if camera.zoom.x > 0.25 :
			camera.zoom -= Vector2(0.05, 0.05)

	if Input.is_action_just_released("MolletDown"):
		if camera.zoom.x < 0.5 :
			camera.zoom += Vector2(0.05, 0.05)
