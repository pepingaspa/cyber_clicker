extends Area2D

func _on_Hurtboxe_area_entered(area):
	get_parent().take_damage(area.get_parent().degat)
