extends StaticBody2D

var balle = preload("res://Entity/Arme/Balles/Balle3.tscn")
var degat = 2
var fire_rate = 0.20
var can_fire = true
var speed = 775

func _process(_delta):
	if Input.is_action_pressed("click") and can_fire:
		var instance = balle.instance()
		instance.global_position = $Position2D.global_position
		instance.rotation_degrees = get_parent().rotation_degrees
		instance.apply_impulse(Vector2(), Vector2(speed, 0).rotated(deg2rad(get_parent().rotation_degrees-4)))
		instance.degat = degat
		get_tree().root.add_child(instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true
