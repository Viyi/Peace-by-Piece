extends Area2D

# class member variables go here, for example
# var a = 2
# var b = "textvar"

onready var king = preload("res://scenes/king_cuddle_bear.tscn")
onready var mattress = preload("res://scenes/mattress.tscn")
onready var pillow = preload("res://scenes/pillow.tscn")
onready var p_borg = preload("res://scenes/p-borg.tscn")
onready var lord_of_slumber = preload("res://scenes/lordofslumber.tscn")

var cost_set = false
var mouse_inside = false
var piece = ""
var obj_piece
var team = 0
var cost = 0
var setup = false



func _ready():
	print()
	
	pass

func _process(delta):
	# Damnit Chase. 
	_set_piece(piece)
	_detect()
	
	# Woo Set Piece
func _set_piece(var name):
	piece = name
	
	# If im already on the right team pass
	if get_parent().turn == team:
		pass
	
	# Set team, and start the switch case
	team = get_parent().turn
	match(piece):
		
		
		# Dynamically assign the sprites based on the current team
		"king":
			get_node("Sprite").set_texture(load("res://sprites/" + str(team) + "/kingcuddlebear-piece.png"))
			obj_piece = king
		"pillow":
			get_node("Sprite").set_texture(load("res://sprites/" + str(team) + "/pillow.png"))
			obj_piece = pillow
		"mattress":
			get_node("Sprite").set_texture(load("res://sprites/" + str(team) + "/mattress.png"))
			obj_piece = mattress
		"p-borg":
			get_node("Sprite").set_texture(load("res://sprites/" + str(team) + "/pillowborg.png"))
			obj_piece = p_borg
		"lord_of_slumber":
			get_node("Sprite").set_texture(load("res://sprites/" + str(team) + "/lordofslumber.png"))
			obj_piece = lord_of_slumber
			
	
	
	var chase = obj_piece.instance()
	add_child(chase)
	if get_parent().pregame:
		cost = chase.points
	else:
		cost = chase.cost
	
	chase.free()
	cost_set = true
	
	get_node("Panel/Label").text = str(cost)
	

func _detect():
	
	# Detects if the spawner has been clicked
	if mouse_inside and Input.is_action_just_pressed("ui_left_click") and !get_parent().spawned:
		
		# Create a new piece based on the switch case
		var two_lines = position
		var chase = obj_piece.instance()
		two_lines.x += 256
		chase.translate(two_lines)
		chase.team = get_parent()._get_player()
		chase.special_snowflake = true
		
		get_parent().add_child(chase)
		get_parent().spawned = true
		# Create new piece and set the sprite to the spawners sprite
		chase.get_node("Sprite").set_texture(load($Sprite.texture.resource_path))
		
		if !get_parent().pregame:
			setup = true
			cost = chase.cost
		
		
			
		if get_parent().points[team] - cost < 0:
			chase.free()
		else:
			get_parent().points[team] -= cost
		print(get_parent().points)
		


func _on_Spawner_mouse_entered():
	mouse_inside = true


func _on_Spawner_mouse_exited():
	mouse_inside = false
	
func is_nil(var v):
	return typeof(v) == 0
