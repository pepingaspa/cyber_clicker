extends StaticBody2D

var balle = preload("res://Entity/Arme/Balles/Balle5.tscn")
var degat = 4
var fire_rate = 1.50
var can_fire = true
var speed = 850

func _process(_delta):
	if Input.is_action_pressed("click") and can_fire:
		var instance = balle.instance()
		instance.global_position = $Position2D.global_position
		instance.rotation_degrees = get_parent().rotation_degrees
		instance.apply_impulse(Vector2(), Vector2(speed, 0).rotated(deg2rad(get_parent().rotation_degrees-4)))
		instance.degat = degat
		get_tree().root.add_child(instance)
		
		var instance2 = balle.instance()
		instance2.global_position = $Position2D2.global_position
		instance2.rotation_degrees = get_parent().rotation_degrees - 10
		instance2.apply_impulse(Vector2(), Vector2(speed, 0).rotated(deg2rad(get_parent().rotation_degrees -12)))
		instance2.degat = degat
		get_tree().root.add_child(instance2)
		
		var instance3 = balle.instance()
		instance3.global_position = $Position2D3.global_position
		instance3.rotation_degrees = get_parent().rotation_degrees + 10
		instance3.apply_impulse(Vector2(), Vector2(speed, 0).rotated(deg2rad(get_parent().rotation_degrees+4)))
		instance3.degat = degat
		get_tree().root.add_child(instance3)
		
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true
