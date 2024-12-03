extends Node

var currentGame;


func _ready():
	SignalBus.game1.connect(_game1)
	SignalBus.game2.connect(_game2)
	SignalBus.home.connect(_close_game)

func _game1():
	currentGame = ResourceLoader.load("res://scenes/flappy_sheep/main.tscn").instantiate()
	show_game()

func _game2():
	currentGame = ResourceLoader.load("res://scenes/sheep_dreams/main.tscn").instantiate()
	show_game()

func show_game():
	$mainmenu.set_visible(false)
	add_child(currentGame)

func _close_game():
	remove_child(currentGame)
	$mainmenu.set_visible(true)
	get_tree().reload_current_scene()
