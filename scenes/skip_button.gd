extends Area2D

var entered = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if entered and Input.is_action_just_pressed("ui_left_click"):
		get_parent().skipped()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Skip_Button_mouse_entered():
	entered = true
	pass # Replace with function body.


func _on_Skip_Button_mouse_exited():
	entered = false
	pass # Replace with function body.
