extends CanvasLayer


func _on_game_1_pressed():
	await get_tree().create_timer(0.3).timeout
	SignalBus.game1.emit()
	
