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
	while !is_nil(current.above):
			moves.append(current.above)
			current = current.above
			
	current = tile
	while !is_nil(current.below):
			moves.append(current.below)
			current = current.below
			
	current = tile
	while !is_nil(current.left):
			moves.append(current.left)
			current = current.left
			
	current = tile
	while !is_nil(current.right):
			moves.append(current.right)
			current = current.right
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
