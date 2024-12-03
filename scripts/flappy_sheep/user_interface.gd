extends CanvasLayer

@onready var death_screen = $game_over
var score

func _ready():
	score = 0
	SignalBus.hit.connect(_game_over)
	SignalBus.scored.connect(_score)

func _score():
	score += 1
	$score_UI/score/points.text = str(score)

func _game_over():
	$game_over.set_visible(true)

func _on_restart_pressed():
	SoundManager.play_sound("play")
	await get_tree().create_timer(0.5).timeout
	score = 0
	$score_UI/score/points.text = "0"
	$game_over.set_visible(false)
	SignalBus.restart.emit()

func _on_quit_meta_clicked(meta):
	SoundManager.play_sound("play")
	await get_tree().create_timer(0.5).timeout
	SignalBus.home.emit()
