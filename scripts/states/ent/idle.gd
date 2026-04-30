extends State

class_name idle

func Update(_delta: float):
	print(ln.inputs)
	if ln.inputs['left'] or ln.inputs['right']:
		print('tried')
		$"..".change_state('run')
