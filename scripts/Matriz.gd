## Backend da tabela, guarda os valores numericos das figuras em uma matriz
## onde o a primeira linha e primeira coluna são os valores em si e as de dentro
## são os resultados das operações deles.
## o [0][0] é o módulo do grupo.

extends Node

@export var dados: Array[PackedInt32Array]
@export var eh_soma: bool 

signal linha_movida(index: int, dir: int)
signal coluna_movida(index: int, dir: int)


func _ready() -> void: 
	print("Original:")
	exibe_dados()
	print(avalia())



## Muda a linha selecionada com a linha na direção, efetivamente movendo uma 
## linha pra cima(-1) ou pra baixo(+1)
func move_linha(i, dir) -> void:
	print("Trocando a linha %s com a linha %s" % [i, i + dir]) # sdds fstrings
	if i + dir <= 1 or i + dir > dados.size():
		print("vo mudar n trouxa")
		return
	
	var selecionado = dados[i]
	var destino = dados[i + dir]
	
	dados[i] = destino
	dados[i + dir] = selecionado
	linha_movida.emit(i, dir)
	
## Muda a coluna selecionada com a coluna na direção, efetivamente movendo uma 
## coluna pra esquerda(-1) ou direita(+1)
func move_coluna(j, dir) -> void:
	print("Trocando coluna %s com a coluna %s" % [j, j + dir])	
	if j + dir <= 1 or j + dir > dados.size():
		print("vo mudar n trouxa")
		return
		
	for i in range(0, dados.size()):
		var selecionado = dados[i][j]
		var destino = dados[i][j + dir]
		
		dados[i][j] = destino
		dados[i][j + dir] = selecionado
	coluna_movida.emit(j, dir)
		
func avalia() -> bool:
	for i in range(1, dados.size()):
		for j in range(1, dados[0].size()):
			if eh_soma: #Calcula se os rótulos naquela posição(0,j e i,0) somados equivalem o ponto em (i,j)
				if (dados[0][j] + dados[i][0]) % dados[0][0] == dados[i][j]: pass
				else: return false
			else: #Calcula se os rótulos naquela posição(0,j e i,0) multiplicados equivalem o ponto em (i,j)
				if (dados[0][j] * dados[i][0]) % dados[0][0] == dados[i][j]: pass
				else: return false
	return true
	
func exibe_dados() -> void:
	for linha in dados:
		print(linha)
	print("-----------------")
