extends Node2D

var last_key
var score = 0
@onready var goal = int(randfn(40, 25)) % 90 + 10

func _ready():
	$Label.text = "Goal: " + str(goal)
	$marker.position.x = $ProgressBar.position.x + ($ProgressBar.size.x * goal / 100)
	$Timer.timeout.connect(func():
		get_parent().hs_check(2, score)
		get_parent().emit_signal("ui_return")
		queue_free())

func _physics_process(delta):
	$igt.text = str($Timer.time_left).left(4)
	$score.text = "Score: " + str(score)
	$ProgressBar.value -= 0.5
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$ProgressBar.value += 1
	if $ProgressBar.value >= goal - 2 and $ProgressBar.value <= goal + 2:
		score += 1
