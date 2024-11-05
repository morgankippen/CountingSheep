extends CanvasLayer

@onready var death_screen = $game_over

func _ready():
	SignalBus.hit.connect(_game_over)

func _game_over():
	$game_over.set_visible(true)

func _on_restart_pressed():
	$game_over.set_visible(false)
	SignalBus.restart.emit()


