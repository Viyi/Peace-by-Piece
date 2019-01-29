extends Node

# loading tiles for deployment



func _ready():
	set_process(true)
	
	var pos = Vector2(0,0)
	
	for y in range(1,8):
		for x in range(6,13):
			pos.x = 128 * x
			pos.y = 128 * y
			var node = preload("res://scenes/tile.tscn").instance()
			node.translate(pos)
			add_child(node)
	
	# get_node(".").add_child(tile)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
