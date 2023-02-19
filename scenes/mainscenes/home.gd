extends Node2D

func _ready():
	$minigame1.pressed.connect(minigame1)
	$minigame2.pressed.connect(minigame2)

func minigame1():
	add_child(load("res://scenes/mainscenes/Minigame1.tscn").instantiate())

func minigame2():
	add_child(load("res://scenes/mainscenes/minigame2.tscn").instantiate())
	
