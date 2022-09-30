extends RigidBody2D

var degat
var targetArea = 2
var targetBody = 2

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Hitboxe_area_entered(_area):
	targetArea -= 1
	if targetArea == 0:
		queue_free()

func _on_Hitboxe_body_entered(_body):
	targetBody -= 1
	if targetBody == 0:
		queue_free()
