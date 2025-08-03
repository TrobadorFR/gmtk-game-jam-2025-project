extends Node2D

var drum_picked_up : bool = false
var pipe_picked_up : bool = false
var violin_picked_up : bool = false

func _ready():
	SignalBus.connect("instrument_picked_up", _on_instrument_picked_up)
	$AudioStreamPlayer.play()

func _on_instrument_picked_up(instrument: String) -> void:
	print("PICKED UP %s" % instrument)
	match instrument:
		"Drum":
			drum_picked_up = true
		"Pipe":
			pipe_picked_up = true
		"Violin":
			violin_picked_up = true
	
	if drum_picked_up and pipe_picked_up and violin_picked_up:
		print("END GAME HERE")
