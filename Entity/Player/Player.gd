extends KinematicBody2D

enum{move,  shop}

signal change(arme)

var tabArme = [ 
				["Arme1", preload("res://Entity/Arme/Arme1.tscn"), 0],
				["Arme2", preload("res://Entity/Arme/Arme2.tscn"), 0],
				["Arme3", preload("res://Entity/Arme/Arme3.tscn"), 2],
				["Arme4", preload("res://Entity/Arme/Arme4.tscn"), 4],
				["Arme5", preload("res://Entity/Arme/Arme5.tscn"), 2],
				["ArmeA", preload("res://Entity/Arme/ArmeA.tscn"), 3]
			]


var life = 10
var living = true
export var speed = 150
var state = move
var degat = 0
var stuff = tabArme[0][0]
var dash = true

func _ready():
	equip(stuff)

func _physics_process(_delta):
	#Déplacement et orientation
	match(state):
		move:
			move_and_look()
			changement()
			sprint()
		shop :
			print("shop")
			state = move

func move_and_look():
	look_at(get_global_mouse_position())
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction += Vector2(0,-1)
	if Input.is_action_pressed("down"):
		direction += Vector2(0,1)
	if Input.is_action_pressed("left"):
		direction += Vector2(-1,0)
	if Input.is_action_pressed("right"):
		direction += Vector2(1,0)
	if Input.is_action_just_pressed("f"):
		state = shop
	var _tmp = move_and_slide(direction.normalized() * speed)

func sprint():
	if Input.is_action_pressed("shift") and dash:
		speed = 400
		dash = false
		yield(get_tree().create_timer(0.3), "timeout")
		speed = 150
		yield(get_tree().create_timer(2), "timeout")
		dash = true

func changement():
	if Input.is_action_just_pressed("1") and stuff != tabArme[0][0] :
		equip(tabArme[0][0])
	if Input.is_action_just_pressed("2") and stuff != tabArme[1][0] :
		equip(tabArme[1][0])
	if Input.is_action_just_pressed("3") and stuff != tabArme[2][0] :
		equip(tabArme[2][0])
	if Input.is_action_just_pressed("4") and stuff != tabArme[3][0] :
		equip(tabArme[3][0])
	if Input.is_action_just_pressed("5") and stuff != tabArme[4][0]:
		equip(tabArme[4][0])
	if Input.is_action_just_pressed("a") and stuff != tabArme[5][0] :
		equip(tabArme[5][0])

func equip(target):
	#Clean
	for child in get_children():
		if "Arme" in child.name :
			child.queue_free()
	#Add child
	for arme in tabArme :
		if arme[0] == target :
			var instance = arme[1].instance()
			add_child(instance)
			instance.name = "Arme"
			$Player.frame = arme[2]
			stuff = target
			emit_signal("change", target)

func take_damage(damage):
	if living :
		life = life - damage
		$HUD.update_life(life)
		if life <= 0 :
			living = false
			$Hurtboxe.visible = false
			$HUD.death()
		else :
			$AnimationPlayer.play("RedBlink")
