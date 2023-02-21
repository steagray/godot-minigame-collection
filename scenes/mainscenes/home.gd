extends Node2D

var high_scores = [0, 0]

func _ready():
	$minigame1.pressed.connect(minigame1)
	$minigame2.pressed.connect(minigame2)
	load_scores()
	var i = 1
	for score in high_scores:
		get_node("mg" + str(i) + "hs").text = "High Score: " + str(score)

func load_scores():
	pass

func minigame1():
	get_parent().add_child(load("res://scenes/mainscenes/Minigame1.tscn").instantiate())

func minigame2():
	get_parent().add_child(load("res://scenes/mainscenes/minigame2.tscn").instantiate())
