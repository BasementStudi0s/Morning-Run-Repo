extends State

class_name run

func Enter():
	pass

func Update(_delta: float):
	cn.friction()
	if ln.vect == 0:
		$"..".change_state('idle')
	else:
		cn.move(ln.vect)
