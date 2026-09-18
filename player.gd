extends CharacterBody2D

@export var speed: float = 200.0
@export var gravity: float = 1000.0
@export var jump_force: float = 400.0

func _physics_process(delta):
	#grav
	if not is_on_floor():
		velocity.y +=gravity * delta
	#movhoriz
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	#salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -jump_force
	
	move_and_slide()
