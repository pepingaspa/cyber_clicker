extends StaticBody2D

var degat = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if(Input.is_action_pressed("click")):
		$AnimationArme.play("Hit")
