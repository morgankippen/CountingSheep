extends Node

@export var pipe_scene : PackedScene

var game_running : bool
var game_over : bool
var scroll
const SCROLL_SPEED : int = 4
var screen_size : Vector2i
var ground_height : int = 180
var pipes : Array
const PIPE_DELAY : int = 150
const PIPE_RANGE : int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.hit.connect(_on_hit)
	SignalBus.restart.connect(_on_restart)
	screen_size = get_window().size
	new_game()

func new_game():
	#reset variables
	game_running = false
	game_over = false
	scroll = 0
	get_tree().call_group("pipes", "queue_free")
	pipes.clear()
	generate_pipes()
	$Sheep.reset()
	start_game()
	
func _input(event):
	if game_over == false:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				SoundManager.play_sound("jump")
				if $Sheep.flying:
					$Sheep.flap()

func start_game():
	game_running = true
	$Sheep.flying = true
	$Sheep.flap()
	#start pipe timer
	$PipeTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_running:
		scroll += SCROLL_SPEED
		#reset scroll
		if scroll >= screen_size.x:
			scroll = 0
		#move ground node
		$Ground.position.x = -scroll
		#move pipes
		for pipe in pipes:
			pipe.position.x -= SCROLL_SPEED


func _on_pipe_timer_timeout():
	generate_pipes()
	
func generate_pipes():
	var pipe = pipe_scene.instantiate()
	pipe.position.x = screen_size.x + PIPE_DELAY
	pipe.position.y = (screen_size.y - ground_height) / 2  + randi_range(-PIPE_RANGE, PIPE_RANGE)
	add_child(pipe)
	pipes.append(pipe)

func stop_game():
	$PipeTimer.stop()
	$Sheep.flying = false
	game_running = false
	game_over = true
	
func _on_hit():
	$Sheep.falling = true
	stop_game()

func _on_restart():
	new_game()
