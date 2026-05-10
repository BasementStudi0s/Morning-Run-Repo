extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.PLAYER.global_position = global_position
