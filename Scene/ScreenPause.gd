extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("echap"):
		if get_tree().paused :
			hide()
			get_tree().paused = false
		else :
			show()
			get_tree().paused = true

func _on_BT_Continuer_pressed():
	hide()
	get_tree().paused = false


func _on_BT_Quit_pressed():
	get_tree().quit()

func _on_BT_Menu_pressed():
	get_tree().paused = false
	var _tmp = get_tree().change_scene("res://Scene/ScreenTitre.tscn")
