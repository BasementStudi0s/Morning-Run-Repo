extends Node
class_name State

@export var particles : Array
@onready var cn = get_parent()

signal Transitioned

#code that every state executes when it is entered
func Enter_State():
	for i in particles.size():
		get_node(particles[i]).emitting = true
#code that every state executes when it is exited
func Exit_State():
	for i in particles.size():
		get_node(particles[i]).emitting = false
func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	pass
