extends Node2D

var high_scores = [5, 0]

signal ui_return

func _ready():
	$minigame1.pressed.connect(minigame1)
	$minigame2.pressed.connect(minigame2)
	ui_return.connect(func(): UI_vis(true))
	load_scores()

func hs_check(minigame, score):
	if score > high_scores[minigame - 1]:
		high_scores[minigame - 1] = score
		update_scores()

func UI_vis(ui_state):
	for node in get_children():
		node.visible = ui_state

func update_scores():
	var i = 1
	for score in high_scores:
		get_node("mg" + str(i) + "hs").text = "High Score: " + str(score)
		i += 1

func load_scores():
	update_scores()

func minigame1():
	UI_vis(false)
	add_child(load("res://scenes/mainscenes/Minigame1.tscn").instantiate())

func minigame2():
	UI_vis(false)
	add_child(load("res://scenes/mainscenes/minigame2.tscn").instantiate())
