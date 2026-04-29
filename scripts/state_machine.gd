extends Node

@export var initial_state : State

var current_state : State
var states : Dictionary = {}


func _ready() -> void:
	#pass player reference to state children nodes
	for i in get_children().size():
		get_children()[i].cn = get_parent()
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
	if initial_state:
		initial_state.Enter()
		initial_state.Enter_State()
		current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.Update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Physics_Update(delta)

func on_child_transition(state, new_state_name):
	if state != current_state:
		return
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.Exit()
		current_state.Exit_State()
	new_state.Enter()
	new_state.Enter_State()
	current_state = new_state

func change_state(new_state):
	if states.has(new_state):
		new_state = states[new_state]
		if current_state:
			current_state.Exit()
			current_state.Exit_State()
			current_state = new_state
		if current_state:
			current_state.Enter()
			new_state.Enter_State()
	else:
		return
