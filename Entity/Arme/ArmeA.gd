extends StaticBody2D

var balle = preload("res://Entity/Arme/Balles/BalleA.tscn")
var degat = 6
var fire_rate = 0.10
var can_fire = true
var speed = 900
var alter = false

func _process(_delta):
	if Input.is_action_pressed("click") and can_fire:
		var instance = balle.instance()
		if alter :
			instance.global_position = $Position2D.global_position
			alter = false
		else :
			instance.global_position=  $Position2D2.global_position
			alter = true
		instance.rotation_degrees = get_parent().rotation_degrees
		instance.apply_impulse(Vector2(), Vector2(speed, 0).rotated(deg2rad(get_parent().rotation_degrees-4)))
		instance.degat = degat
		get_tree().root.add_child(instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true
