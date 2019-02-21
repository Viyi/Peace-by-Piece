extends Area2D

var mouse_inside = false
var selected = false
var placed = true
var type = 0
var tile
var team = 0
var moves = []

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _process(delta):
	_move()

func _move():

		# This is the meat of the piece, i'll try to explain it well
		
		# If mouse is just clicked and it's inside the piece then we start to move it
		if mouse_inside and Input.is_action_just_pressed("ui_left_click"):
			selected = true
			placed = false
			
		# Now that we are moving the piece we set the position to our mouse and wait until release
		if !placed:
			position = get_global_mouse_position()
			
			# Now the mouse is released and the magic starts
			if !Input.is_action_pressed("ui_left_click"):
				placed = true
				
				# Create an array of all the objects you are touching
				var temp_ray = get_overlapping_areas()

				if temp_ray.size() > 0:
					# Check to make sure you're touching a tile object
					if temp_ray[0].filename == "res://scenes/tile.tscn":
						# Make a temp tile to compare to the tiles we have in the moves array
						var temp_tile = temp_ray[0]
						if !is_nil(tile) or moves.has(temp_tile):
							tile = temp_tile
						# Set position to the tile, unhighlight the tiles, and reset the moves array
						position = tile.position
						_unshow_movement()
						_set_moves()
						
		# This is basically used to show the movement of the piece without holding click
		if selected:
			if is_nil(tile):
				_show_movement()
			# Pretty simple, if you click somewhere else it deselects the tile
			#TODO Add it so you can click on a highlighted tile to move the piece
			if !mouse_inside and Input.is_action_just_pressed("ui_left_click"):
				selected = false
				_unshow_movement()
				
# Goes through the move array and highlights the tiles
func _show_movement():
	if moves.size() > 0:
		for a in range(moves.size()):
				moves[a]._highlight()
				
# Opposite of _show_movement()
func _unshow_movement():
	if moves.size() > 0:
		for a in range(moves.size()):
				moves[a]._unhighlight()
			
# This defines where the piece can move by adding tiles to the moves array
# This should be the only thing we change in the children of this node
func _set_moves():
	moves = []
	print("Setting Moves")
	
	if is_nil(tile.above):
			moves.append(tile.above)
	if is_nil(tile.below):
			moves.append(tile.below)
	if is_nil(tile.left):
			moves.append(tile.left)
	if is_nil(tile.right):
			moves.append(tile.right)

func _take():
	var victim = tile.piece

		
# This checks if nil.
func is_nil(var v):
	return typeof(v) != 0

# A signal to check if our piece has been entered
func _on_Piece_mouse_entered():
	mouse_inside = true

func _on_Piece_mouse_exited():
	mouse_inside = false



