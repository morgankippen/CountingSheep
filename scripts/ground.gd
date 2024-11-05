extends Area2D

signal hit

func _on_body_entered(body):
	print("Hit ground")
	hit.emit()
