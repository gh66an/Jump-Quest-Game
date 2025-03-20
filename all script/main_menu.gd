extends Node

@onready var click_sound: AudioStreamPlayer2D = $clickSound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_level1_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/level/level 1/level1.tscn")


func _on_level2_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/level/level 2/level2.tscn")


func _on_exit_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()




func _on_start_game_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/UI/main_menu.tscn")
