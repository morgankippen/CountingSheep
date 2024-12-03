extends CharacterBody2D


func _physics_process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	position.x = clamp(mouse_position.x, 10, 740)
	move_and_slide()
