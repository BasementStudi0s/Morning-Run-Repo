extends State

class_name run

func Enter():
	print('function entered')

func Update(_delta: float):
	var inp = ln.inputs
	print('before')
	if not inp.is_empty():
		print('is empty')
		var vect = int(inp['right']) - int(inp['left'])
		if vect == 0:
			print('vect was 0')
			$"..".change_state('idle')
		else:
			cn.move(vect)
