extends State

class_name inair


func Update(_delta: float):
	cn.coyoteTimer -= 1
	cn.friction(.1)
	cn.move(ln.vect, 50)
	if cn.velocity.y > 0: cn.velocity.y += cn.downwardVel
	if cn.is_on_floor():
		$"..".change_state('idle')
	
