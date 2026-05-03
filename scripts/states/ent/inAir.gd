extends State

class_name inair

func Update(_delta: float):
	cn.friction(.1)
	cn.move(ln.vect, 50)
	if cn.velocity.y > 0: cn.velocity.y += 1
	if cn.is_on_floor():
		$"..".change_state('idle')
	
