extends Label

func _process(delta: float) -> void:
	var a = $"../StateMachine".name + ': ' + str($"../StateMachine".current_state.name)
	var b = $"../phyShapeStateMachine".name + ': ' + str($"../phyShapeStateMachine".current_state.name)
	text = a + ', ' + b
	
