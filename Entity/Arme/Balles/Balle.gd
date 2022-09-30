extends RigidBody2D

var degat

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Hitboxe_area_entered(_area):
	queue_free()

func _on_Hitboxe_body_entered(_body):
	queue_free()
