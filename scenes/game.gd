extends Node

# loading tiles for deployment

var turn = 1

func _ready():
	set_process(true)
	
	var pos = Vector2(0,0)
	
	for y in range(1,8):
		for x in range(4,11):
			pos.x = 256 * x
			pos.y = 256 * y
			var node = preload("res://scenes/tile.tscn").instance()
			node.translate(pos)
			
			add_child(node)
	
	# get_node(".").add_child(tile)
func _changeTurns():
	if turn == 1:
		turn = 2
	elif turn == 2:
		turn = 1

func _getActivePlayer():
	return turn

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
