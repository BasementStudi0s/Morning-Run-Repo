extends Label

func _process(delta: float) -> void:
	text = str($"../StateMachine".current_state)
