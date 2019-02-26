extends "res://scenes/piece.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _set_moves():
	moves = []
	var current = tile
	if !is_nil(current.above):
			moves.append(current.above)
			current = current.above
			
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
