extends Node

@onready var pause_panel: Panel = $pausePanel  
@onready var click_sound: AudioStreamPlayer2D = $clickSound


func _ready() -> void:
	pause_panel.hide()  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("pause")
	if esc_pressed:
		if get_tree().paused:
			 
			get_tree().paused = false
			pause_panel.hide()
		else:
			
			get_tree().paused = true
			pause_panel.show()


func _on_resume_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().paused = false
	pause_panel.hide()

func _on_gomain_menu_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.3).timeout
	pause_panel.hide()     
	get_tree().paused = false     
	get_tree().change_scene_to_file("res://scenes/UI/main_menu.tscn")  
