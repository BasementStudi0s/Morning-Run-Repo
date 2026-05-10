extends Sprite2D

@onready var p_icon: Sprite2D = $pIcon
@onready var c_icon: Sprite2D = $cIcon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var p = Global.PLAYER.position.x
	var c = Global.CHASER.position.x
	p_icon.position.x = p/10
	c_icon.position.x = c/10
