extends Sprite2D


var playerPath = []
var followDistance = 1
var oldPlayerPos = Vector2(0, 0)

func _process(delta: float) -> void:
	record()


func _on_timer_timeout() -> void:
	$StateMachine.change_state('chase')
	
func record():
	if Global.PLAYER.position == oldPlayerPos:
		print('you are still')
	else:
		print('u are moving')
		playerPath.append(Global.PLAYER.position)
	oldPlayerPos = Global.PLAYER.position
