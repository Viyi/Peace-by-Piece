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
	if !is_nil(current.above):
		current = current.above
		if !is_nil(current.above):
			current = current.above
			if !is_nil(current.right):
				moves.append(current.right)
			if !is_nil(current.left):
				moves.append(current.left)
				
	current = tile
	if !is_nil(current.below):
		current = current.below
		if !is_nil(current.below):
			current = current.below
			if !is_nil(current.right):
				moves.append(current.right)
			if !is_nil(current.left):
				moves.append(current.left)
	
	current = tile
	if !is_nil(current.left):
		current = current.left
		if !is_nil(current.left):
			current = current.left
			if !is_nil(current.above):
				moves.append(current.above)
			if !is_nil(current.below):
				moves.append(current.below)
	
	current = tile
	if !is_nil(current.right):
		current = current.right
		if !is_nil(current.right):
			current = current.right
			if !is_nil(current.above):
				moves.append(current.above)
			if !is_nil(current.below):
				moves.append(current.below)
			
	attacks = moves
			
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
