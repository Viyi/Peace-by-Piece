extends Node

var player = AudioStreamPlayer.new()

func _ready():
	
	self.add_child(player)
	player.stream = load("res://sprites/pbp.wav")
