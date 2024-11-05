extends Area2D

func _on_body_entered(body):
	SignalBus.hit.emit()

func _on_score_area_body_entered(body):
	SignalBus.scored.emit()



