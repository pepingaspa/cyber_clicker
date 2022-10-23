extends Node2D

var score
var gold

var path = "res://Scene/ScreenDeath.tscn"

func _on_BT_Menu_pressed():
	var _tmp = get_tree().change_scene("res://Scene/ScreenTitre.tscn")


func _on_BT_Quit_pressed():
	get_tree().quit()

func modif(valueScore, valueGold):
	$Score.text = valueScore
	$Gold.text = valueGold
