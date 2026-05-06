extends State

class_name shapeactivate

@export var shape : CollisionShape2D

func Enter():
	shape.disabled = false
	
func Exit():
	shape.disabled = true

func Update(_delta: float):
	#when state is not active, hard code the shape to be disabled
	if $"..".current_state.script != self.script: shape.disabled = true
