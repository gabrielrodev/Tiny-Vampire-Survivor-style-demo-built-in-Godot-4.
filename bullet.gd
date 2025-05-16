extends Area2D

var travelled_distance = 0

func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation) ##RIGHT = Vector2(1, 0): Right unit vector. Represents the direction of right.
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body: Node2D) -> void: ## a signal is connected to an item
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
		
