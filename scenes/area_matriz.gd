extends Area2D
@onready var colisao_matriz = $colisao_matriz

# eu sou muito burro pra fazer isso funcionar
func set_size(tamanho: Vector2, posicao: Vector2) -> void:
	print_debug("recebendo :", tamanho)
	colisao_matriz.shape.size = tamanho
	#global_position = posicao
	position.x = posicao.x/2
	position.y = posicao.y/2  

func _on_mouse_entered():
	Global.tem_area_selecionada = true


func _on_mouse_exited():
	Global.tem_area_selecionada = false
