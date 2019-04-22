extends "res://scenes/piece.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	points = 3
	cost = 2
	pass

func _set_moves():
	
	# Yes this looks bad. 
	# It is.
	# Adds knight movement
	
	moves = []
	var current = tile
	while !is_nil(current.above) and !is_nil(current.above.right):
		current = current.above.right
		moves.append(current)
		if !is_nil(current.piece):
			break
		
	current = tile
	while !is_nil(current.below) and !is_nil(current.below.right):
		current = current.below.right
		moves.append(current)
		if !is_nil(current.piece):
			break
		
	current = tile
	while !is_nil(current.above) and !is_nil(current.above.left):
		current = current.above.left
		moves.append(current)
		if !is_nil(current.piece):
			break
				
	
	current = tile
	while !is_nil(current.below) and !is_nil(current.below.left):
		current = current.below.left
		moves.append(current)
		if !is_nil(current.piece):
			break
		
				
	
	attacks = moves
			
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
