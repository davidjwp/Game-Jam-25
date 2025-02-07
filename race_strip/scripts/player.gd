extends CharacterBody3D


const SPEED = 10 
const JUMP_VELOCITY = 4.5 #Pour le troll mais useless 
var press_time = 0
var max_time = 10

var charge_counter = 0
var charge_time = 0
var distance_travelled = 0
var target_distance = 0
var moving = false

@onready var charge_bar = $UI/ProgressBar

var move_direction = Vector3(0, 0, -1)  

func _process(delta):
	if Input.is_action_pressed("throttle"):
		charge_counter += delta
		if charge_counter >= 1:
			charge_time += 1
			charge_counter = 0
			charge_bar.update_progress(charge_time, max_time)

	if Input.is_action_just_released("throttle"):
		target_distance = charge_time * SPEED
		velocity = move_direction * SPEED
		moving = true
		distance_travelled = 0
		charge_time = 0.0
		charge_bar.update_progress(charge_time,max_time)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if moving :
		distance_travelled += velocity.length() * delta
		if distance_travelled >= target_distance:
			velocity = Vector3.ZERO
			moving = false 
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()
