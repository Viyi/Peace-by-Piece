extends Area2D

# class member variables go here, for example
# var a = 2
# var b = "textvar"

onready var king = preload("res://scenes/king_cuddle_bear.tscn")
onready var mattress = preload("res://scenes/mattress.tscn")
onready var pillow = preload("res://scenes/pillow.tscn")
onready var p_borg = preload("res://scenes/p-borg.tscn")

var mouse_inside = false
var piece = ""
var obj_piece




func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Damnit Chase. 
	_detect()
	
func _set_piece(var name):
	piece = name
	
	match(piece):
		
		"king":
			get_node("Sprite").set_texture(load("res://sprites/kingcuddlebear-piece.png"))
			obj_piece = king
		"pillow":
			get_node("Sprite").set_texture(load("res://sprites/pillow.png"))
			obj_piece = pillow
		"mattress":
			get_node("Sprite").set_texture(load("res://sprites/mattress.png"))
			obj_piece = mattress
		"p-borg":
			get_node("Sprite").set_texture(load("res://sprites/pillowborg.png"))
			obj_piece = p_borg

func _detect():
	if mouse_inside and Input.is_action_just_pressed("ui_left_click"):
		var two_lines = position
		var chase = obj_piece.instance()
		
		print(chase.position)
		two_lines.x += 256
		chase.translate(two_lines)
		get_tree().get_root().add_child(chase)
		


func _on_Spawner_mouse_entered():
	mouse_inside = true


func _on_Spawner_mouse_exited():
	mouse_inside = false
