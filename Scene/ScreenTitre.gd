extends Node2D

func _on_BT_Play_pressed():
	var _tmp = get_tree().change_scene("res://Scene/ScreenArene.tscn")


func _on_BT_Quit_pressed():
	get_tree().quit()


func _on_BT_Tuto_pressed():
	var _tmp = get_tree().change_scene("res://Scene/ScreenTutoriel.tscn")
