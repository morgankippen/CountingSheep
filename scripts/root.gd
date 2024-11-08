extends Node

var currentGame;


func _ready():
	SignalBus.game1.connect(_game1)
	SignalBus.home.connect(_close_game)

func _game1():
	$mainmenu.set_visible(false)
	currentGame = ResourceLoader.load("res://scenes/flappy_sheep/main.tscn").instantiate()
	add_child(currentGame)

func _close_game():
	remove_child(currentGame)
	$mainmenu.set_visible(true)
	get_tree().reload_current_scene()
