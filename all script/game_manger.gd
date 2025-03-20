extends Node



@onready var points_label: Label = %pointsLabel
@export var hearts : Array[Node]
var points=0
var lives=3


func decrease_health():
	lives -= 1
	for h in range(3): 
		if h < lives:
			hearts[h].show()
		else:
			hearts[h].hide()
	if lives == 0:
		call_deferred("restart_scene")  
func restart_scene():
	get_tree().reload_current_scene()


		
		
func add_points():
	points+=1
	print(points)
	points_label.text=": "+str(points)
