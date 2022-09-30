extends Node2D



func _on_BT_Play_pressed():
	var _tmp = get_tree().change_scene("res://Scene/ScreenArene.tscn")


func _on_BT_Retour_pressed():
	var _tmp = get_tree().change_scene("res://Scene/ScreenTitre.tscn")
