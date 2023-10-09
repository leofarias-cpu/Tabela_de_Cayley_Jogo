extends Panel
@onready var sprite = $Sprite2D
@onready var label = $Label
@export var valor: int = -99
var selecionado = false
var selecionavel = true
var posicao: Array

signal mudei(posicao: Array, valor: int)

func _process(delta) -> void:
	if selecionado and Global.ta_segurando and selecionavel:
		if Input.is_action_just_pressed("left_click"):
			muda_figura(Global.figura_segurada)
			Global.limpa()
	if Input.is_action_just_pressed("right_click"):
		pass

func muda_texto(texto: String) -> void:
	label.text = texto


func muda_figura(figura: Figura) -> void:
	sprite.texture = figura.imagem
	valor = figura.valor
	muda_texto(str(valor))


func _on_area_2d_mouse_entered():
	selecionado = true

func _on_area_2d_mouse_exited():
	selecionado = false
