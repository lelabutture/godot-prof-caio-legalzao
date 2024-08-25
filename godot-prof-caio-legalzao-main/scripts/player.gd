extends Area2D

signal hit
const SPEED := 400
@onready var screen_size = get_viewport_rect().size
@onready var anim = $anim
@onready var collision = $collision


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	
	if velocity.x != 0:
		anim.play("move")
	elif velocity.y < 0:
		anim.play("move_up")
	elif velocity.y > 0:
		anim.play("move_down")
	else:
		anim.play("idle")
		
	#if velocity.x > 0:
		#anim.flip_h = false
	#else:
		#anim.flip_h = true
	anim.flip_h = true if velocity.x < 0 else false
	
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

#verificação da colisão do player com os bugs (inimigos)s
func _on_body_entered(body):
	hide()
	hit.emit()
	collision.set_deferred("disabled", true)


func _on_hit() -> void:
	pass # Replace with function body.


func game_over() -> void:
	pass # Replace with function body.


func _on_bugtimer_timeout() -> void:
	pass # Replace with function body.
	var bug = bug_scene.instantiate()
	var bug_location = $"../bugPath/bugpathlocation"
	bug_location.progress_ratio = randf()
	
	var direction = bug_location.rotation + PI/2
	bug.position = bug_location.position
	direction += randf_range(-PI/4,PI/4)
	bug.rotation = direction
	
	var velocity =Vector2(randf_range(150.0,250.0),0.0)
	bug.linear_velocity = velocity.rotated(direction)
	add_child(bugsssssss)
	
func _on_scoretimer_timeout() -> void:
	var score += 1


func _on_startimer_timeout() -> void:
	$bugtimer.star()
	$scoretimer.sart()
	
