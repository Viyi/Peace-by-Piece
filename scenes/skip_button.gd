extends Area2D

var team = 1
var entered = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
		


func _process(delta):
	if entered and Input.is_action_just_pressed("ui_left_click"):
		get_parent().skipped()
	
	if get_parent().turn != team:
		team = get_parent().turn
		change_sprite()

func change_sprite():
	get_node("Sprite").set_texture(load("res://sprites/" + str(team) + "/skip.png"))

func _on_Skip_Button_mouse_entered():
	entered = true
	print("boom baybe")
	pass # Replace with function body.


func _on_Skip_Button_mouse_exited():
	entered = false
	pass # Replace with function body.
