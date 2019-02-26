extends Area2D

var mouse_inside = false
var placed = false
var type = 0
var tile
var team = 1

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _process(delta):
	if typeof(tile) != 0:
		_show_rmovement(tile, "Below")
		
	if mouse_inside and Input.is_action_pressed("ui_left_click"):
		if placed:
			_show_movement()
			
		placed = false
		position = get_global_mouse_position()
	elif !placed and !Input.is_action_pressed("ui_left_click"):
		var temp_ray = get_overlapping_areas()
		if temp_ray.size() > 0:
			position = temp_ray[0].position
			tile = temp_ray[0]
			placed = true
	else:
		placed = true
	
func _show_movement():
	
	# tile.below._highlight()
	pass
	
func _show_rmovement(var o, var d):
	
	if typeof(o) == 0:
		return 0
		
	o._highlight()
	return _show_rmovement(o.below, d) 

	
	

func _on_Piece_mouse_entered():
	mouse_inside = true

func _on_Piece_mouse_exited():
	mouse_inside = false



