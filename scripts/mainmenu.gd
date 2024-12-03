extends CanvasLayer


func _on_game_1_pressed():
	SoundManager.play_sound("play")
	await get_tree().create_timer(0.3).timeout
	SignalBus.game1.emit()

func _on_game_2_pressed():
	SoundManager.play_sound("play")
	await get_tree().create_timer(0.3).timeout
	SignalBus.game2.emit()
