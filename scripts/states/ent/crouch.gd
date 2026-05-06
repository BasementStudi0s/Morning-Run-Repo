extends State

class_name crouch

func Enter():
	$"../../phyShapeStateMachine".change_state('phycrouch')

func Update(_delta: float):
	
	if !ln.inputs['crouch'] and !$"../../checkArea".coll:
		$"..".change_state('idle')
	cn.move(ln.vect)
	cn.friction()

func Exit():
	$"../../phyShapeStateMachine".change_state('phystand')
