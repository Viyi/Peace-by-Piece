extends Area2D

var sprite = ""
var mouse_inside = false
var selected = false
var placed = true
var type = "King"
var tile
var team = 0
var moves = []
var attacks = []
var points
var cost
var moves_set = false
var unshown = true
var special_snowflake = false
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _process(delta):
	if get_parent().turn == team:
		_move()
		next_to_king(tile)
	else:
		moves_set = false

func _move():
		if mouse_inside and Input.is_action_just_pressed("ui_left_click") and (!get_parent().pregame or (!get_parent().spawned or special_snowflake)):
			selected = true
			placed = false
			z_index = 2
		
		if !placed:
			picked_up()
			
		movement_control()
		highlight_control()
		
func movement_control():
	if !is_nil(tile) and !moves_set and selected:
		_unshow_movement()
		_set_moves()
		limited_movement()
		
		
func picked_up():
	if Input.is_action_just_released("ui_left_click"):
				placed = true
				selected = false
				snap_to_piece()
				z_index = 0
				return
				
	position = get_global_mouse_position()

func snap_to_piece():
	var temp_ray = get_overlapping_areas()
	
	if temp_ray.size() > 0 and temp_ray[0].filename == "res://scenes/tile.tscn":
		var temp_tile = temp_ray[0]
		
		if tile == temp_tile:
			selected = true
			
		elif get_parent().pregame:
			if is_nil(temp_tile.piece) and temp_tile.team == team and is_nil(tile):
				if !is_nil(tile):
					tile.piece = null
				tile = temp_tile
				tile.piece = self
				special_snowflake = false
				get_parent()._change_turns()
		elif is_nil(tile) and next_to_king(temp_tile) and is_nil(temp_tile.piece):
			tile = temp_tile
			tile.piece = self
			get_parent()._change_turns()
		elif !is_nil(tile) and is_nil(temp_tile.piece) and (is_nil(tile) or moves.has(temp_tile)):
			if !is_nil(tile):
				tile.piece = null
			tile = temp_tile
			tile.piece = self
			get_parent()._change_turns()
		
		elif !is_nil(tile) and !is_nil(temp_tile.piece) and temp_tile.piece.team != team and attacks.has(temp_tile):
			tile.piece = null
			tile = temp_tile
			_take()
			get_parent()._change_turns()
			
		
	if !is_nil(tile):	
		position = tile.position
		
func highlight_control():
	if !mouse_inside and Input.is_action_just_pressed("ui_left_click") and selected == true:
		selected = false
		_unshow_movement()
		return
	elif placed and !selected:
		if !unshown:
			_unshow_movement()
		
	if selected:
		unshown = false
		_show_movement()

# Goes through the move array and highlights the tiles
func _show_movement():
	
	if moves.size() > 0:
		for a in range(moves.size()):
				moves[a]._highlight()
	if attacks.size() > 0:
		for a in range(attacks.size()):
			if !is_nil(attacks[a].piece) && attacks[a].piece.team != team:
				attacks[a]._highlight()
				
# Opposite of _show_movement()
func _unshow_movement():
	
	unshown = true
	if moves.size() > 0:
		for a in range(moves.size()):
				moves[a]._unhighlight()
	if attacks.size() > 0:
		for a in range(attacks.size()):
			if !is_nil(attacks[a].piece) && attacks[a].piece.team != team:
				attacks[a]._unhighlight()
			
# This defines where the piece can move by adding tiles to the moves array
# This should be the only thing we change in the children of this node
# If you give it true it will unrestrict bounds and not stop at pieces
func _set_moves():
	_unshow_movement()
	moves = []
	
	
	if !is_nil(tile.above):
			moves.append(tile.above)
	if !is_nil(tile.below):
			moves.append(tile.below)
	if !is_nil(tile.left):
			moves.append(tile.left)
	if !is_nil(tile.right):
			moves.append(tile.right)
	
	attacks = moves
	moves_set = true

func limited_movement():
	pass

func _take():
	if is_nil(tile.piece) or tile.piece == self:
		return
	get_parent().points[team] += tile.piece.points
	
	
	tile.piece.free()
	tile.piece = self
		
func blocked(var t):
	if is_nil(t):
		return -1
	# returns 1 if a friendly unit 2 if an enemy unit is on the spot
	if !is_nil(t.piece):
		if t.piece.team == team:
			return 1
		
		return 2
	
	return 0

func targeted(var t):
	var current = t
	
	if is_nil(t):
		return -1
	
	while !is_nil(current.above):
			current = current.above
			
	while !is_nil(current.left):
			current = current.left
			
	var temp_current = current
	while !is_nil(current):
		
		# If the tile is target it returns 1
		while !is_nil(temp_current):
			if !is_nil(temp_current.piece) and temp_current.piece.team != team:
				tile.piece = null
				temp_current.piece._set_moves()
				if temp_current.piece.attacks.has(t):
					tile.piece = self
					temp_current.piece._set_moves()
					return 1
				tile.piece = self
				temp_current.piece._set_moves()
			temp_current = temp_current.below
		current = current.right
		temp_current = current
	# Returns 0 if not targeted at all
	return 0
	
func next_to_king(var t):
	if !is_nil(t):
		if !is_nil(t.left) and !is_nil(t.left.piece) and t.left.piece.filename == "res://scenes/king_cuddle_bear.tscn" and t.left.piece.team == team:
			return true
		if !is_nil(t.right) and !is_nil(t.right.piece) and t.right.piece.filename == "res://scenes/king_cuddle_bear.tscn" and t.right.piece.team == team:
			return true
		if !is_nil(t.below) and !is_nil(t.below.piece) and t.below.piece.filename == "res://scenes/king_cuddle_bear.tscn" and t.below.piece.team == team:
			return true
		if !is_nil(t.above) and !is_nil(t.above.piece) and t.above.piece.filename == "res://scenes/king_cuddle_bear.tscn" and t.above.piece.team == team:
			return true
	
	return false

# func get_name():
	
		
# This checks if nil.
func is_nil(var v):
	return typeof(v) == 0

# A signal to check if our piece has been entered
func _on_Piece_mouse_entered():
	
	mouse_inside = true

func _on_Piece_mouse_exited():
	mouse_inside = false



