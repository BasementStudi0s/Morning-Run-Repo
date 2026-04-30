extends State

class_name inair

func Update(_delta: float):
	if cn.is_on_floor():
		$"..".change_state('idle')
