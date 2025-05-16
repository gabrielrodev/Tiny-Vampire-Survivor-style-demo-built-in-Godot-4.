extends CharacterBody2D ## adds code in top on top of the code that goddot already has on character2D
##      ^^^^^^^^^^^^^^^ We can control click the node to get more info

signal health_depleted

var health= 100.0

func _physics_process(delta: float) -> void: ## update physics to allow the move of characters
	var direction = Input.get_vector("move_left","move_right","move_up","move_down") ##variable direction = input which is like a function to call build in functions. takes 4 inputs 
	velocity = direction * 600
	move_and_slide()

	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit() ## ckeck if the code work by putting the break point f9
			
			
		
