extends State

class_name wallslide

func Enter():
	cn.gravityMult = .4
	cn.velocity.y /= 2
	cn.coyoteTimer = 0

func Update(_delta: float):
	'''
	#implement getting off better later
	
	if ln.vect == cn.get_wall_normal().x:
		getOff(200, false)
	'''
	
	if ln.inputs['mjump']:
		getOff()
		

func Exit():
	cn.gravityMult = 1
	

func getOff(offVel = 1200, jump = true):
	cn.velocity.x = offVel * cn.get_wall_normal().x
	if jump: cn.jump()
