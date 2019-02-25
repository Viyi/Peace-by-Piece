extends Node2D

# class member variables go here

# basic initialization variable
var init = false

# these will be the surrounding tiles
var above
var below
var left
var right

# stores the piece it currently has
var piece


func _set_tiles():
	
	if !init:
		
		if get_node("ray_below").is_colliding():
			below = get_node("ray_below").get_collider()
			print(below)
			
		
		get_node("ray_below").free()
		
		if get_node("ray_above").is_colliding():
	    	 above = get_node("ray_above").get_collider()
			
		get_node("ray_above").free()
		
		if get_node("ray_left").is_colliding():
	    	 left = get_node("ray_left").get_collider()
			
		get_node("ray_left").free()
		
		if get_node("ray_right").is_colliding():
	    	right = get_node("ray_right").get_collider()
	    	
		
		get_node("ray_right").free()
		
		init = true
		
	
func _set_piece(o):
	piece = o

func _highlight():
	get_node("Sprite").set_texture(load("res://sprites/brick_tile_dark.png"))
	
func _unhighlight():
	get_node("Sprite").set_texture(load("res://sprites/brick_tile.png"))

func below():
	print(below)
	return below

func _ready():
	pass
	

func _process(delta):
	_set_tiles()
	
