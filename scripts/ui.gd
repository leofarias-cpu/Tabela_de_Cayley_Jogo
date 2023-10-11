extends Control

@onready var matriz = $Matriz
@export var grid: GridContainer
@export var seguraveis: GridContainer
@export var painel_packed: PackedScene
@export var seguravel: PackedScene
@export var figuras_necessarias_pra_avaliar: int
var cont_figuras = 0
var paineis: Array

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		avalia()
		#$MarginContainer/area_matriz.set_size(grid.size, grid.global_position)
	

func _ready():
	grid.columns = matriz.dados[0].size()
	
#Setup da matriz de paineis, de indices equivalentes da matriz de valores
	for i in range(matriz.dados.size()):
		paineis.append([])
		
		for j in range(matriz.dados.size()):
			var painel = painel_packed.instantiate()
			paineis[i].append(painel)
			painel.mudei.connect(on_mudanca)
			painel.posicao = Vector2(i, j)
			grid.add_child(painel)
	#$MarginContainer/area_matriz.set_size(grid.size, grid.position)
	
##Define rotulos e cria os botoes onde voce pega as figuras
func define_rotulos(rotulos: Array[Figura]) -> void:
	for i in range(rotulos.size()):
		print_debug(i)
		paineis[i][0].muda_figura(rotulos[i])
		paineis[0][i].muda_figura(rotulos[i])
		
		paineis[i][0].selecionavel = false
		paineis[0][i].selecionavel = false
		
		paineis[i][0].quadrado_de_rotulo()
		paineis[0][i].quadrado_de_rotulo()
		
		var valor = rotulos[i].valor
		matriz.dados[i][0] = valor
		matriz.dados[0][i] = valor
	for j in range(1, rotulos.size()):
		var segura = seguravel.instantiate()
		segura.figura = rotulos[j]
		segura.atualiza_figura()
		seguraveis.add_child(segura)
	print_debug(matriz.exibe_dados())


func define_figuras_iniciais(posicoes, rotulos) -> void:
	for k in range(len(posicoes)):
		for l in range(0, len(posicoes[k]), 2):
			var i = int(posicoes[k][l])
			var j = int(posicoes[k][l + 1])
			paineis[i][j].muda_figura(rotulos[k + 1])
			on_mudanca(Vector2(i, j), rotulos[k + 1].valor)


func avalia() -> void:
	matriz.exibe_dados()
	var identidade = matriz.avalia()
	var acertou = true
	for i in range(1, len(identidade)):
		for j in range(1, len(identidade)):
			exibe_avaliacao(Vector2(i, j), identidade[i][j])
			if not identidade[i][j]:
				acertou = false
				
	if acertou:
		Global.niveis_completos[Global.nivel_atual] = true
		await get_tree().create_timer(6).timeout
		reseta_paineis()
		Global.volta_pro_level_select()
	else:
		await get_tree().create_timer(3).timeout
		reseta_quadrados()
	#exibe_avaliacao(Vector2.UP, false)
			

func exibe_avaliacao(posicao: Vector2, ta_certo) -> void:
	paineis[posicao.x][posicao.y].exibe_quadrado(ta_certo)


func reseta_quadrados() -> void:
	for i in range(1, len(matriz.dados)):
		for j in range(1, len(matriz.dados)):
			paineis[i][j].reseta_quadrado()

func on_mudanca(posicao: Vector2,  valor: int) -> void:
	matriz.dados[posicao.x][posicao.y] = valor
	cont_figuras += 1
	if cont_figuras >= figuras_necessarias_pra_avaliar:
		pass
	

func reseta_paineis() -> void:
	for i in range(len(paineis)):
		for j in range(len(paineis)):
			paineis[i][j].tira_figura()
