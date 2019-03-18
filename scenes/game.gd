extends Node

# That's a Two Liner


var turn = 2
# loading tiles for deployment

var teams = 2

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
	var pieces = ["king","pillow","mattress","p-borg"]
	pos = Vector2(256,512)
	var spawn = preload("res://scenes/spawner.tscn")
	for a in range(pieces.size()):
		var s = spawn.instance()
		pos.y += 256
		s.translate(pos)
		add_child(s)
		s._set_piece(pieces[a])
	
	# get_node(".").add_child(tile)
func _change_turns():
	turn += 1
	
	if turn > teams:
		turn = 1
	
		


func _get_player():
	return turn


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
