extends Node2D

@onready var ui = $CanvasLayer/Ui
@export var rotulos: Array[Figura]
##Array de strings onde cada par de string é uma coordenada para inserção
##da figura naquela posição em rotulos, ou seja, a string na poisocao 1 fala
##em que lugares o primeiro elemento de rotulos vai cair
@export var iniciais: Array[String]

func _ready() -> void:
	ui.define_rotulos(rotulos)
	ui.define_figuras_iniciais(iniciais, rotulos)
