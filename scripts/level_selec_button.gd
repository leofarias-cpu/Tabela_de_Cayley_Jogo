extends Control
var nivel_conectado: PackedScene
@onready var sprite = $Sprite2D
@onready var button = $Button
var nivel: int

func _on_button_pressed():
	Global.nivel_atual = nivel
	get_tree().change_scene_to_packed(nivel_conectado)
