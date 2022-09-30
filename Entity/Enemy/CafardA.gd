extends KinematicBody2D

var life = 6
var degat = 2
var speed = 125
var detect_zone = 800
var rng = RandomNumberGenerator.new()
var bounce_cd = 0
var target_pos = Vector2.ZERO
var direction = Vector2.DOWN
var add = true
var score = 10

var gold

var player

func _ready():
	rng.randomize()
	player = get_tree().root.get_node("ScreenArene/Player")
	gold = rng.randi_range(0,5)

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision != null and collision.collider.name != "Player" and add:
		add = false
		bounce_cd += 1
	update_orientation()

func take_damage(damage):
	life = life - damage
	if life <= 0:
		get_tree().root.get_node("ScreenArene/Player/HUD").update_gold(gold)
		get_tree().root.get_node("ScreenArene/Player/HUD").update_score(score)
		queue_free()
	else :
		direction = -direction
		$AnimationCafard.play("RedBlink")

func _on_Timer_timeout():
	if get_tree().root.has_node("ScreenArene/Player"):
		target_pos = player.position - position
	else :
		target_pos = Vector2.ZERO
	
	if target_pos.length() <= detect_zone and bounce_cd == 0:
		direction = target_pos.normalized()
	elif bounce_cd > 0 :
		var angle = rng.randf_range(-PI/2, PI/2)
		direction = -direction.rotated(angle)
		bounce_cd -= 1
		add = true
	else :
		var choice = rng.randf_range(0,1)
		if choice < 0.3 :
			direction = Vector2.ZERO
		elif 0.3 <= choice and choice <= 0.5 :
			direction = direction
		else :
			var angle = rng.randf_range(0, 2 * PI)
			direction = Vector2(1.0, 0.0).rotated(angle)

#MAJ de l'orientation lors du déplacement
func update_orientation():
	var norm_direction = direction.normalized()
	#Down - Left
	if norm_direction.y >= 0.5 and norm_direction.x <= -0.5 :
		rotation_degrees = 135
	#Down - Right
	elif norm_direction.y >= 0.5 and norm_direction.x >= 0.5 :
		rotation_degrees = 45
	#Up - Left
	elif norm_direction.y <= -0.5 and norm_direction.x <= -0.5 :
		rotation_degrees = -135
	#Up - Right
	elif norm_direction.y <= -0.5 and norm_direction.x >= 0.5:
		rotation_degrees = -45
	#Down
	elif norm_direction.y >= 0.70:
		rotation_degrees = 90
	#Up
	elif norm_direction.y <= -0.70:
		rotation_degrees = -90
	#Left
	elif norm_direction.x <= -0.70:
		rotation_degrees = -180
	#Right
	elif norm_direction.x >= 0.70:
		rotation_degrees = 0

