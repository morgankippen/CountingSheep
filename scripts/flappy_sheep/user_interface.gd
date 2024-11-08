extends CanvasLayer

@onready var death_screen = $game_over

func _ready():
	SignalBus.hit.connect(_game_over)

func _game_over():
	$game_over.set_visible(true)

func _on_restart_pressed():
	SoundManager.play_sound("play")
	await get_tree().create_timer(0.5).timeout
	$game_over.set_visible(false)
	SignalBus.restart.emit()

func _on_quit_meta_clicked(meta):
	SignalBus.home.emit()
