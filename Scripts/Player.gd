extends KinematicBody2D

export var move_speed: float = 200
var velocity: Vector2
var animator: AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	animator = $AnimatedSprite
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	##This is the advanced mode. 
	var move_vertical = Input.get_action_strength('ui_down') - Input.get_action_strength("ui_up")
	var move_horizontal = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	velocity.y = move_vertical
	velocity.x = move_horizontal
	
	#And the easy mode
#	if Input.is_action_pressed('ui_down'):
#		velocity.y += 1
#	elif Input.is_action_pressed('ui_up'):
#		velocity.y -= 1
#	else:
#		velocity.y = 0
		
	velocity = velocity.normalized() * move_speed
	move_and_slide(velocity)
	#play animations
	animator.play('fly')
	
	if bat in get_overlapping_bodies():
		print_debug('Bat collision')
	
	pass
