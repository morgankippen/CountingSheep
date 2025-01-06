extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	SignalBus.restart.connect(_on_restart)
	
func _on_restart():
	$Spawner/SpawnTimer.start()
