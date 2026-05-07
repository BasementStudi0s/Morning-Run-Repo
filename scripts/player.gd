extends physics

var hydration = 1
var hp = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#hydration
	hydration = clamp(hydration, 0, 1)
	hp = clamp(hp, 0, 1)
	
	if hydration <= 0:
		hp -= 0.001
	if hydration >= 0.2:
		hp += 0.001
	print('hydro: ', hydration)
	print('hp: ', hp)
	
func jump(a = 1000):
	super() #inherits parent class jump
	hydration -= 0.01
func move(vect, max = 1000, speed = 400):
	super(vect, max, speed)
	hydration -= 0.0001 + ($StateMachine/logic.sprinting * 0.0001)
