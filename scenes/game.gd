extends Node

# That's a Two Liner


var turn = 2
# loading tiles for deployment

var teams = 2
var points = []
var pregame = true
var skips = [true,false,false]
func _ready():
	set_process(true)
	
	var pos = Vector2(0,0)
	
	# Spawns tiles, eventually will be a tile set
	var points_label = preload("res://scenes/points_display.tscn")
	for y in range(1,8):
		for x in range(4,11):
			pos.x = 256 * x
			pos.y = 256 * y
			print(str(pos.y))
			var node = preload("res://scenes/tile.tscn").instance()
			node.translate(pos)
			add_child(node)
			if y < 3:
				node.team = 2
			elif y > 5:
				node.team = 1
				
	
	# Sets the pieces that will be used
	# Need to make this into multiple arrays soon
	var pieces = ["king","pillow","mattress","p-borg"]
	pos = Vector2(256,512)
	var spawn = preload("res://scenes/spawner.tscn")
	
	# Generates spawners dynamically based on the array
	for a in range(pieces.size()):
		var s = spawn.instance()
		pos.y += 256
		s.translate(pos)
		add_child(s)
		s._set_piece(pieces[a])
		
	var s = preload("res://scenes/Skip Button.tscn").instance()
	pos.y += 256
	s.translate(pos)
	add_child(s)
	
	#initialilzes the points counter array
	for i in range(teams+1):
		points.append(15)
		
	
	# get_node(".").add_child(tile)
func _change_turns():
	turn += 1

	if turn > teams:
		turn = 1
	
		
func skipped():
	skips[turn] = true
	for a in skips:
		if !a:
			return
	pregame = false
	
	

func _get_player():
	return turn


func _process(delta):
	if pregame and skips[turn]:
		_change_turns()
