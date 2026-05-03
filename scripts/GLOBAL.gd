extends Node

var playerFollowPath = []

@onready var ROOT = get_tree().root
@onready var WORLD = ROOT.get_node('world')
@onready var PLAYER = WORLD.get_node('player')

func _process(delta: float) -> void:
	#playerFollowPath.append(PLAYER.global_position)
	pass
