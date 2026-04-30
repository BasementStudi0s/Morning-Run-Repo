extends logic


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	inputs = {
		'jump': Input.is_action_just_pressed("jump"), 
		'left': Input.is_action_pressed('left'), 
		'right': Input.is_action_pressed('right')
	}
	
	if cn.is_on_floor():
		if inputs['jump']:
			cn.jump()
			$"..".change_state('inair')
	else:
		$"..".change_state('inair')
	
