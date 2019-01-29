extends Node2D

# class member variables go here

# these will be the surrounding tiles

var above
var below
var left
var right

# stores the piece it currently has

var piece


func _set_tiles():
	
	if get_node("ray_below").is_colliding():
		_highlight()
		var below = get_node("ray_below").get_collider()
	
	if get_node("ray_above").is_colliding():
    	var above = get_node("ray_above").get_collider()
	
	if get_node("ray_left").is_colliding():
    	var left = get_node("ray_left").get_collider()
	
	if get_node("ray_right").is_colliding():
    	var right = get_node("ray_right").get_collider()
	
func _set_piece(o):
	piece = o

func _highlight():
	get_node("Sprite").set_texture(load("res://sprites/temp_tile_bright.png"))
	
func _unhighlight():
	get_node("Sprite").set_texture(load("res://sprites/temp_tile.png"))


func _ready():
	_set_tiles()
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
