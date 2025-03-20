extends Node

 
@onready var click_sound: AudioStreamPlayer2D = $clickSound


func _ready() -> void:
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/level/level 1/level1.tscn") 

	

func _on_gomain_menu_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.3).timeout          
	get_tree().change_scene_to_file("res://scenes/UI/main_menu.tscn")  
