#mostly taken from here: https://github.com/voithos/elfin/blob/master/scripts/sfx.gd
extends Node

const POOL_SIZE = 4
var pool = []
var next_player = 0

#change to loop if we end up with more than a few sounds
const SFX = {
	"score": preload("res://assets/sounds/fruitcollect.wav"),
	"jump": preload("res://assets/sounds/jump.wav"),
	"click": preload("res://assets/sounds/click.wav"),
	"play": preload("res://assets/sounds/playgame.wav")
}

func _ready():
	_init_stream_players()

func _init_stream_players():
	for i in range(POOL_SIZE):
		var player = AudioStreamPlayer.new()
		add_child(player)
		pool.append(player)

func _get_next_player_idx():
	var next = next_player
	next_player = (next_player + 1) % POOL_SIZE
	return next

func play_sound(sample):
	assert(sample in SFX)
	var stream = SFX[sample]
	var idx = _get_next_player_idx()
	var player = pool[idx]
	player.stream = stream
	player.play()
