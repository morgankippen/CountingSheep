extends Node2D  # The parent node is a Node2D

# Export the PackedScene of the falling sprite (Area2D)
var sprite_scene : PackedScene  # The scene of the falling sprite (Area2D)

func _ready():
	$SpawnTimer.start()  # Start the timer to begin spawning

func _on_SpawnTimer_timeout():
	# Instantiate the sprite scene (falling Area2D sprite)
	var sprite_instance = sprite_scene.instance()
	
	# Set a random X position within the screen width (Y position is 0)
	var random_x = randf_range(0, get_viewport().size.x)
	sprite_instance.position = Vector2(random_x, 0)
	
	# Add the sprite to the scene
	add_child(sprite_instance)


func _on_spawn_timer_timeout():
	pass # Replace with function body.
