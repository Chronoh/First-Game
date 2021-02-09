extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
const SPEED = 180
const GRAVITY = 26.23
const JUMPFORCE = -500



func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("Jump"):
		$AnimatedSprite.play("Jump")
	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			velocity.y = JUMPFORCE
		if Input.is_action_pressed("right"):
			$AnimatedSprite.play("Run")
		elif Input.is_action_pressed("left"):
			$AnimatedSprite.play("Run")
		else: 
			$AnimatedSprite.play("Idle")
	elif velocity.y > 100:
		$AnimatedSprite.play("Fall")
	if is_on_wall():
		if Input.is_action_just_pressed("Jump"):
			velocity.y = JUMPFORCE
	

	if velocity.y < 1000:
		velocity.y += GRAVITY
	
	
	#print(velocity.y)
	
		
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.25)


func _on_Fallzone_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")
	
func add_coin():
	coins += 1
	print("I now have %s coins" % coins)
	if coins == 34: 
		
		get_tree().change_scene("res://Level1.tscn")
