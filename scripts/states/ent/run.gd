extends State

class_name run

func Update(_delta: float):
	var speed = int(ln.inputs['sprint'])
	var addedSpeed = speed * 500
	cn.move(ln.vect, 1500 + addedSpeed, 1000 + addedSpeed)
	if ln.vect:
		cn.friction()
	else:
		$"..".change_state('idle')
