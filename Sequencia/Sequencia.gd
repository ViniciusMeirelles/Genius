extends Node

onready var genius = get_parent()
onready var botaoAzul = get_parent().get_node("BotaoAzul")
onready var botaoVermelho = get_parent().get_node("BotaoVermelho")
onready var botaoAmarelo = get_parent().get_node("BotaoAmarelo")
onready var botaoVerde = get_parent().get_node("BotaoVerde")
onready var timer = get_node("Timer_sequencia")
onready var tempoApertarBotao = get_node("TempoApertarBotao")

var ultimaSequencia
var sequenciaAtual

func _ready():
	ultimaSequencia = Array()
	sequenciaAtual = Array()

func geraSequencia(jogada):
	tempoApertarBotao.stop()
	sequenciaAtual = ultimaSequencia.duplicate()
	sequenciaAtual.push_back(geraNovoBotaoSeq())
	ultimaSequencia = sequenciaAtual.duplicate()

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
	
	return botao_gerado

func tocaSequencia():
	for i in sequenciaAtual:
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
	return sequenciaAtual.size()

func botaoEstaCorreto(botao):
	resetTimerApertarBotao()
	if botao == sequenciaAtual.pop_front():
		return true
	else:	return false

func resetTimerApertarBotao():
	tempoApertarBotao.start()
