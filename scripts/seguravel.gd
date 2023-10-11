extends Control
@export var figura: Figura
@export var sprite: Sprite2D
@export var label = Label
@onready var Global = get_node("/root/Global")
var selecionado = false

#func _ready() -> void:
	#sprite.texture = figura.imagem
	#label.text = str(figura.valor)
	
func _process(delta) -> void:	
	if selecionado:
		if Input.is_action_just_pressed("left_click"):
			Global.figura_segurada = self.figura
			Global.ta_segurando = true
			Global.texture = figura.imagem
		
func _on_mouse_entered():
	selecionado = true
	sprite.scale = Vector2(1.5 , 1.5)
	
func _on_mouse_exited():
	selecionado = false
	sprite.scale = Vector2(1 , 1)

func atualiza_figura() -> void:
	sprite.texture = figura.imagem
	label.text = str(figura.valor)
