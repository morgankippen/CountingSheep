extends Area2D  # Change to Area2D since we are using an Area2D node

var velocity : Vector2 = Vector2()  # Velocity of the sprite (x, y)

func _process(delta):
	velocity = Vector2(0, randf_range(200, 260))
	position += velocity * delta
	if position.y > 900:
		queue_free()

func _on_body_entered(body):
	SignalBus.hit.emit()
	queue_free()
