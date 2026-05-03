extends State

class_name idle

func Update(_delta: float):
	cn.friction()
	if ln.vect: $"..".change_state('run')
