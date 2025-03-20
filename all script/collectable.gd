extends Area2D

@onready var game_manger: Node = %gameManger
@onready var collectable_sound: AudioStreamPlayer2D = $collectableSound


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		collectable_sound.play()
		await get_tree().create_timer(0.1).timeout
		queue_free()
		game_manger.add_points()
