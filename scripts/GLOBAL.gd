extends Node

var playerFollowPath = []

@onready var ROOT = get_tree().root
@onready var WORLD = ROOT.get_node('world')
@onready var LEVEL = WORLD.get_node('level')
@onready var PLAYER = LEVEL.get_node('player')
@onready var MAINMENU = WORLD.get_node('mainMenu')
@onready var CHASER = null

func _ready() -> void:
	reloadLevel()

func findGroupInBodies(l, g):
	for i in l.size():
		if l[i].is_in_group(g):
			return true
	return false

func reloadLevel():
	PLAYER.hp = 1
	PLAYER.hydration = 1
	var n = LEVEL.get_node('lvl')
	var nNew = n.scene_file_path
	n.free()
	var newLevel = load(nNew).instantiate()
	LEVEL.add_child(newLevel)
	newLevel.name = 'lvl'
	CHASER = LEVEL.get_node('lvl').get_node('chaser')



'''
take a value(v) and search through the list(l)
return every index where the value is present
in the form of an array
EXAMPLE: 
myList = ['a', 'b', 'c', 'a', 'c', 'a']

print( findMatching( myList, 'a' ) )
------------------------------------
should return [0, 3, 5], becuase there is an 'a' at indexes 0, 3, 5
'''
func findMatching(l, v): #l stands for list, v stands for value
	pass

'''
get the amount of times a value is present in the list
'''
func countItemsInList(l, v):
	pass
