extends CharacterBody2D

var gravityMult = 1

func _physics_process(delta: float) -> void:
	var g = get_gravity() * gravityMult * delta
	if not is_on_floor(): velocity += g
	move_and_slide()
	

func move(vect, speed = 400, max = 1000):
	velocity.x += vect * speed
	#max velocity
	if abs(velocity.x) > max:
		velocity.x = sign(velocity.x) * max
	
func friction(a = .6):
	#friction
	velocity.x -= velocity.x * a

func jump(a = 500):
	velocity.y = -a
	
