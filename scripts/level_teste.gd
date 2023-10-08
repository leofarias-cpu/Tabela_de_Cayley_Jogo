extends Node2D

@export var rotulos: Array[Figura]
@onready var ui = $CanvasLayer/Ui

func _ready() -> void:
	ui.define_rotulos(rotulos)
