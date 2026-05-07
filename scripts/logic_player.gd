extends logic

var vect = 0
var oldVect = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#this is where all the inputs for player are stored
	#when m is infront of an action it stands for momentary, meaning the value is only true for a frame
	#after initial key stroke
	inputs = {
		'jump': Input.is_action_pressed("jump"), 
		'mjump': Input.is_action_just_pressed("jump"),
		'left': Input.is_action_pressed('left'), 
		'right': Input.is_action_pressed('right'), 
		'sprint': Input.is_action_pressed("sprint"),
		'crouch': Input.is_action_pressed("crouch"), 
		'mcrouch': Input.is_action_just_pressed("crouch")
	}
	
	#vect variable uses left and right to make programming movement easier
	vect = int(inputs['right']) - int(inputs['left'])
	
	logi()
	
	oldVect = vect #keep this at end
func logi():
	var amInAir = $"..".current_state.script == load("res://scripts/states/ent/inAir.gd")
	var amCrouching = $"..".current_state.script == load("res://scripts/states/ent/crouch.gd")
	
	'''
	#reimplement this later (dash)
	if vect and cn.canDash and $"..".current_state.script == load("res://scripts/states/ent/inAir.gd"):
		cn.canDash = false
		$"..".change_state('dash', true)
	'''
	
	if inputs['mcrouch'] and cn.is_on_floor():
		if vect:
			$"..".change_state('slide', true)
		else:
			$"..".change_state('crouch', true)
		return
	
	if cn.is_on_floor():
		cn.canDash = true
		cn.coyoteTimer = cn.coyoteTime
		cn.coyoteDepartPos = cn.position
	#sensing for wall slide
	if cn.is_on_wall_only() and amInAir and cn.get_wall_normal().x == -vect:
		$"..".change_state('wallslide', true)
		return #if you do this state you dont wanna try changing it more
	
	#sensing for jumping
	if inputs['jump'] and !amCrouching and (cn.is_on_floor() or cn.coyoteTimer > 0): #make it so that you can only jump during idle or run
		cn.position.y = cn.coyoteDepartPos.y
		cn.coyoteTimer = 0
		cn.jump()
		$"..".change_state('inair')
		return
	
	if cn.is_on_wall() or cn.is_on_floor(): return #makes sure the player isnt doing any parkour stuff
	
	$"..".change_state('inair')
