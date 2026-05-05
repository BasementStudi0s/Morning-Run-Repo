extends State

class_name inair


func Update(_delta: float):
	cn.coyoteTimer -= 1
	cn.friction(.1)
	cn.move(ln.vect, 1000, 50)
	
	#makes falling quicker to give the gravity a better feeling
	if cn.velocity.y > 0: cn.velocity.y += cn.downwardVel
	
	#switches to idle when on floor
	if cn.is_on_floor():
		cn.jumping = false
		$"..".change_state('idle')
	
	if cn.jumping and !ln.inputs['jump']: #handle jumping variable
		cn.jumping = false
		
		#if player is still in upward velocity after a jump, 
		#and the above conditions are true (jump button released), then 
		#jump velocity is dampened
		if cn.velocity.y < 0: cn.velocity.y *= 0.7 
	
