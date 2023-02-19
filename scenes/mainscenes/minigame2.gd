extends Node2D

var last_key
var score = 0
@onready var goal = int(randfn(40, 25)) % 100

func _ready():
	$Label.text = "Goal: " + str(goal)
	$Timer.timeout.connect(func():queue_free())

func _physics_process(delta):
	$igt.text = str($Timer.time_left).left(4)
	$score.text = "Score: " + str(score)
	$ProgressBar.value -= 0.5
	if Input.is_action_pressed("ui_cancel"):
		$ProgressBar.value += 1
	if $ProgressBar.value >= goal - 2 and $ProgressBar.value <= goal + 2:
		score += 1
