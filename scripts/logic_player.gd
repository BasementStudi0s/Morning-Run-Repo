extends logic

var vect = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#this is where all the inputs for player are stored
	inputs = {
		'jump': Input.is_action_pressed("jump"), 
		'mjump': Input.is_action_just_pressed("jump"),
		'left': Input.is_action_pressed('left'), 
		'right': Input.is_action_pressed('right')
	}
	
	#vect variable uses left and right to make programming movement easier
	vect = int(inputs['right']) - int(inputs['left'])
	
	logi()
	
func logi():
	if cn.is_on_floor():
		cn.coyoteTimer = cn.coyoteTime
		cn.coyoteDepartPos = cn.position
	#sensing for wall slide
	if cn.is_on_wall_only() and $"..".current_state.script == load("res://scripts/states/ent/inAir.gd"):
		$"..".change_state('wallslide', true)
		return #if you do this state you dont wanna try changing it more
	
	#sensing for jumping
	if inputs['jump'] and (cn.is_on_floor() or cn.coyoteTimer > 0): #make it so that you can only jump during idle or run
		cn.position.y = cn.coyoteDepartPos.y
		cn.coyoteTimer = 0
		cn.jump()
		$"..".change_state('inair')
		return
	
	if cn.is_on_wall() or cn.is_on_floor(): return #makes sure the player isnt ding any parkour stuff
	
	$"..".change_state('inair')
	
	
	
