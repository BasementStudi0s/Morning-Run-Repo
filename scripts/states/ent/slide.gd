extends State

class_name slide

var dir = 0
var slideDist = 0

func Enter():
	dir = ln.vect
	cn.velocity.x = dir * 1000
	slideDist = 10
	$"../../phyShapeStateMachine".change_state('phycrouch')

func Update(_delta: float):
	slideDist -= 1
	if (!ln.inputs['crouch'] or slideDist <= 0) and !$"../../checkArea".coll:
		$"..".change_state('idle')


func Exit():
	$"../../phyShapeStateMachine".change_state('phystand')
