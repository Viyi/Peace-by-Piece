extends Node

# loading tiles for deployment

var holding

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
			
	
	
	var n = preload("res://scenes/piece.tscn").instance()
	n.translate(pos)
	add_child(n)
	var nu = preload("res://scenes/piece.tscn").instance()
	pos.x += 256
	nu.translate(pos)
	add_child(nu)
	
	# get_node(".").add_child(tile)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
