extends CanvasLayer

var tabArme = [
	["Arme1"],
	["Arme2"],
	["Arme3"],
	["Arme4"],
	["Arme5"],
	["ArmeA"]
	]

func _ready():
	$Gold.text = str(0)
	$Score.text = str(0)
	$ScreenPause.visible = false

func update_life(life) :
	var children = $Indice.get_children()
	for child in children :
		if int(child.name) >= life :
			child.visible = false
		else :
			child.visible = true 

func update_gold(gold):
	var tmp = int($Gold.text) + gold
	$Gold.text = str(tmp)

func update_score(score):
	var tmp = int($Score.text) + score
	$Score.text = str(tmp)

func update_view(arme):
	for child in tabArme :
		var tmp = get_node("Armes/" + child[0])
		if tmp.name == arme:
			tmp.visible = true
		else :
			tmp.visible = false
