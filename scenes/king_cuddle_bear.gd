extends "res://scenes/piece.gd"



# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	points = 0
	cost = 0
	pass
	
func _process(delta):
	if get_parent().turn == team:
		_move()
		checkmate()
		
	
	
func checkmate():
	limited_movement()
	if targeted(tile) == 1 && moves.size() < 1:
		get_tree().reload_current_scene()
		queue_free()
		
func limited_movement():
	var bad_moves = []
	
	
	if moves.size() < 1:
		return 
	for move_tile in moves:
		if  blocked(move_tile) == 1 or targeted(move_tile) == 1:
			
			bad_moves.append(move_tile)
		# elif blocked(move_tile) == 2 and targeted(move_tile) == 1:
		#	print("yeeeeeb")
		#	bad_moves.append(move_tile)
	
	
	for move_tile in bad_moves:
			moves.erase(move_tile)
	
	
	
	
	
		
