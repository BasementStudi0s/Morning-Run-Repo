extends State

class_name chase



func Update(_delta: float):
	
	if cn.playerPath.size() >= cn.followDistance:
		cn.position = cn.playerPath[0]
		cn.playerPath.remove_at(0)
	
