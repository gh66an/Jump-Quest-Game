extends Area2D

@onready var game_manger: Node = %gameManger

@onready var game_over_sound: AudioStreamPlayer2D = $gameOverSound
@onready var level_2_sound: AudioStreamPlayer2D = $level2Sound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		if(game_manger.points>=30):
			level_2_sound.play()
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://scenes/level/level 2/level2.tscn")
		else:
			game_over_sound.play()
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://scenes/UI/endGameUI.tscn")
