extends Area2D  # Change to Area2D since we are using an Area2D node

var velocity : Vector2 = Vector2(0, 200)  # Velocity of the sprite (x, y)

func _process(delta):
	position += velocity * delta
	if position.y > 900:
		queue_free()

func _on_body_entered(body):
	SignalBus.scored.emit()
	queue_free()
