extends CanvasLayer

@export var niveis: Array[PackedScene]
@export var trofeis: Array[Texture2D]
@export var botoes: HBoxContainer
@export var botao_packed: PackedScene


func _ready() -> void:
	for i in range(len(niveis)):
		var botao = botao_packed.instantiate()
		botao.nivel_conectado = niveis[i]
		botao.nivel = i
		botoes.add_child(botao)
		if Global.niveis_completos[i]:
			botao.sprite.texture = trofeis[i]
		else:
			botao.button.text = str(i + 1)
			
			
