extends Node2D

var buttons = []
var score = 0
var clicks = 0

func _ready():
	randomize()
	$BubbleTimer.timeout.connect(bubbleSpawn)
	$GameTime.timeout.connect(func(): 
		$BubbleTimer.stop()
		$Label.text = "GAME OVER"
		await get_tree().create_timer(5).timeout
		$Label.text = "Your accuracy: " + str(score) + "/" + str(clicks)
		await get_tree().create_timer(5).timeout
		queue_free())

func _physics_process(delta):
	if $GameTime.time_left > 0:
		$Label.text = str($GameTime.time_left).left(4)

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		clicks += 1

func bubbleSpawn():
	$BubbleTimer.wait_time = randf()
	if randi() % 100 > 20:
		var valid = true 
		var check_pos = Vector2(randf() * ($Buttons.size.x - 50), randf() * ($Buttons.size.y - 50))
		for circle in buttons:
			if circle.position == check_pos:
				valid = false
		if valid:
			var circle = Button.new()
			circle.position = check_pos
			circle.pressed.connect(func(): 
				score += 1
				circle.queue_free())
			circle.size = Vector2(50, 50)
			$Buttons.add_child(circle)
			get_tree().create_timer(2).timeout.connect(func(): 
				if circle != null:
					circle.queue_free())
	$BubbleTimer.start()
