extends Sprite

var cafardA = 	preload("res://Entity/Enemy/CafardA.tscn")
var cafardB = 	preload("res://Entity/Enemy/CafardB.tscn")
var vers = 		preload("res://Entity/Enemy/Vers.tscn")
var drone = 	preload("res://Entity/Enemy/Drone.tscn")
var rng = RandomNumberGenerator.new()
var start = false
var can_spawn = false

func _ready():
	rng.randomize()

func _on_Timer_timeout():
	start = true
	can_spawn = true

func _process(_delta):
	if start and can_spawn :
		var time = rng.randi_range(5, 10)
		can_spawn = false
		yield(get_tree().create_timer(time), "timeout")
		can_spawn = true
		#Match sur le type d'ennemi à spawner
		var instance
		var type = rng.randi_range(4,4)
		match(type):
			1:
				instance = cafardA.instance()
			2:
				instance = cafardB.instance()
			3:
				instance = vers.instance()
			4:
				instance = drone.instance()
		instance.position = global_position
		get_tree().root.get_node("ScreenArene").add_child(instance)

