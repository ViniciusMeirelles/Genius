extends Node

onready var genius = get_parent()
onready var botaoAzul = get_parent().get_node("BotaoAzul")
onready var botaoVermelho = get_parent().get_node("BotaoVermelho")
onready var botaoAmarelo = get_parent().get_node("BotaoAmarelo")
onready var botaoVerde = get_parent().get_node("BotaoVerde")
onready var timer = get_node("Timer_sequencia")

var sequencia = Array()

func geraSequencia(jogada):
	for i in jogada:
		geraNovoBotaoSeq()

func geraNovoBotaoSeq():
	var num_um_a_quatro = randi()%4+1
	var botao_gerado = ""
	
	if num_um_a_quatro == 1:
		botao_gerado = "botaoAzul"
	elif num_um_a_quatro == 2:
		botao_gerado = "botaoVermelho"
	elif num_um_a_quatro == 3:
		botao_gerado = "botaoAmarelo"
	elif num_um_a_quatro == 4:
		botao_gerado = "botaoVerde"
	
	sequencia.push_back(botao_gerado)

func tocaSequencia():
	for i in sequencia:
		timer.start()
		yield(timer, "timeout")
		
		if i == "botaoAzul":
			botaoAzul.ligaBotao()
		elif i == "botaoVermelho":
			botaoVermelho.ligaBotao()
		elif i == "botaoAmarelo":
			botaoAmarelo.ligaBotao()
		elif i == "botaoVerde":
			botaoVerde.ligaBotao()
	genius.comecaJogo()

func getTamSeq():
	return sequencia.size()

func botaoEstaCorreto(botao):
	if botao == sequencia.pop_front():
		return true
	else:	return false
