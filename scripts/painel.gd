extends Panel
@onready var sprite = $Sprite2D
@onready var label = $Label
@onready var quadrado = $quadrado
@export var valor: int = -99
@onready var vazio = preload("res://figuras/vazio.tres")
## O painel é selecionado quando o mouse ta em cima dele, e rótulos não são selecionaveis
var selecionado = false
var selecionavel = true
## Posicão desse painel na matriz, determinada pela UI
var posicao: Vector2

signal mudei(posicao: Vector2, valor: int)

func _process(delta) -> void:
	if selecionado and Global.ta_segurando and selecionavel:
		if Input.is_action_just_pressed("left_click"):
			muda_figura(Global.figura_segurada)
			Global.limpa()
	if Input.is_action_just_pressed("right_click") and selecionavel and selecionado:
		tira_figura()
		mudei.emit(posicao, valor)

func muda_texto(texto: String) -> void:
	label.text = texto


func muda_figura(figura: Figura) -> void:
	sprite.visible = true
	sprite.texture = figura.imagem
	valor = figura.valor
	muda_texto(str(valor))
	mudei.emit(posicao, valor)


func exibe_quadrado(eh_painel_correto) -> void:
	var tween = get_tree().create_tween()
	quadrado.visible = true
	if eh_painel_correto:
		quadrado.modulate = Color.GREEN
	else:
		quadrado.modulate = Color.DARK_RED
	tween.tween_property(quadrado, "scale", Vector2(0.9, 0.9), 0.5)


func quadrado_de_rotulo() -> void:
	quadrado.scale = Vector2(0.9, 0.9)
	quadrado.visible = true
	quadrado.modulate = Color.INDIGO


func reseta_quadrado() -> void:
	quadrado.visible = false
	quadrado.modulate = Color.WHITE
	quadrado.scale = Vector2(0.1, 0.1)

func _on_area_2d_mouse_entered():
	selecionado = true

func _on_area_2d_mouse_exited():
	selecionado = false

func tira_figura() -> void:
	muda_figura(vazio)
