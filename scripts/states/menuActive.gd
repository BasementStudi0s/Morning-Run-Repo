extends State

class_name menuactive


func _process(delta: float) -> void:
	var c = get_child(0)
	print($"..".current_state.script == self.script)
	if $"..".current_state == self:
		c.process_mode = Node.PROCESS_MODE_PAUSABLE
		c.visible = true
	else:
		c.process_mode = Node.PROCESS_MODE_DISABLED
		c.visible = false
