extends Node

var playerFollowPath = []

@onready var ROOT = get_tree().root
@onready var WORLD = ROOT.get_node('world')
@onready var LEVEL = WORLD.get_node('level')
@onready var PLAYER = LEVEL.get_node('player')

func _process(delta: float) -> void:
	#playerFollowPath.append(PLAYER.global_position)
	pass

func findGroupInBodies(l, g):
	for i in l.size():
		if l[i].is_in_group(g):
			return true
	return false
