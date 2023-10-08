extends Control

@onready var matriz = $Matriz
@onready var grid = $MarginContainer/GridContainer
@export var painel_packed: PackedScene
var paineis: Array


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		avalia()


func _ready():
	grid.columns = matriz.dados[0].size()
	@warning_ignore("unused_variable")
	var linhas: int = matriz.dados.size()
	
#Setup da matriz de paineis, de indices equivalentes da matriz de valores
	for i in range(matriz.dados.size()):
		paineis.append([])
		
		for j in range(matriz.dados[0].size()):
			var painel = painel_packed.instantiate()
			#painel.mim_procure.connect(encontra_querido)
			paineis[i].append(painel)
			grid.add_child(painel)

	
func define_rotulos(rotulos: Array[Figura]) -> void:
	for i in range(rotulos.size()):
		paineis[i][0].muda_figura(rotulos[i])
		paineis[0][i].muda_figura(rotulos[i])
		
		paineis[i][0].selecionavel = false
		paineis[0][1].selecionavel = false
		
		var valor = rotulos[i].valor
		matriz.dados[i][0] = valor
		matriz.dados[0][1] = valor
	print(matriz.exibe_dados())


func avalia() -> void:
	for i in range(1, paineis.size()):
		for j in range(paineis[0].size()):
			matriz.dados[i][j] = paineis[i][j].valor
	print(matriz.avalia())
			
			
#func encontra_querido(painel: Panel) -> Array[int]:
#	for i in range(paineis.size()):
#		for j in range(paineis[0].size()):
#			if paineis[i][i] == painel:
#				print([i, j])
#				return [i, j]
#	return [-123]
		
