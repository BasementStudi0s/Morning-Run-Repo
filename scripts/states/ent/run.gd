extends State

class_name run

func Enter():
	cn.playAnim('run')

func Update(_delta: float):
	var speed = ln.sprinting * int(cn.hydration > 0)
	var addedSpeed = speed * 600
	cn.move(ln.vect, cn.maxSpeed + addedSpeed, cn.moveSpeed + addedSpeed)
	if ln.vect:
		cn.friction()
	else:
		$"..".change_state('idle')
