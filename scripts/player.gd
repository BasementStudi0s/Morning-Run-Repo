extends physics

var hydration = 1
var hp = 1
var moveSpeed = 500
var maxSpeed = 1000
var crouchMaxSpeed = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#hydration
	hydration = clamp(hydration, 0, 1)
	hp = clamp(hp, 0, 1)
	
	if hydration <= 0:
		hp -= 0.001
	if hydration >= 0.2:
		hp += 0.001
	
func jump(a = 500):
	super() #inherits parent class jump
	hydration -= 0.01

func move(vect, max = maxSpeed, speed = moveSpeed):
	super(vect, max, speed)
	hydration -= 0.0001 + ($StateMachine/logic.sprinting * 0.0001)

func damage(a):
	hp -= a
