extends ProgressBar

func update_progress(press_time: float, max_time: float):
	if max_time > 0:
		value = (press_time / max_time) * max_value
	else:
		value = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func reset_progress():
	value = 0
