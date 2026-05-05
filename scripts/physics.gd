extends CharacterBody2D

const grav = 3000
var gravityMult = 1
var coyoteTime = 10
var coyoteTimer = 0
var coyoteDepartPos = Vector2(0, 0)
var downwardVel = 3
var jumping = false

var canDash = true

func _physics_process(delta: float) -> void:
	var g = grav * gravityMult * delta
	if not is_on_floor(): velocity.y += g
	move_and_slide()
	

func move(vect, max = 1000, speed = 400):
	velocity.x += vect * speed
	#max velocity
	if abs(velocity.x) > max:
		velocity.x = sign(velocity.x) * max
	
func friction(a = .6):
	#friction
	velocity.x -= velocity.x * a

func jump(a = 1000):
	jumping = true
	velocity.y = -a
	
