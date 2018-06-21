extends Node

onready var sequencia = get_node("Sequencia")
onready var telaDerrota = get_node("TelaDerrota")
onready var pontos = get_node("Pontos")
onready var botaoStart = get_node("BotaoStart")

var estado #naoIniciado, mostrandoSeq, testandoSeq, terminado
var buffer_estado # Usado quando o jogo é pausado
var numJogada

export var tempo_espera = 1.5

func _ready():
	set_process(false)
	randomize()
	estado = "naoIniciado" #naoIniciado, mostrandoSeq, testandoSeq, terminado
	numJogada = 0
	telaDerrota.esconder()

func comecaJogo():
		botaoStart.desativaBotao()
		set_process(true)

func _process(delta):
	controlaJogo()

func controlaJogo():
	if estado=="naoIniciado" or estado=="testandoSeq":
		set_process(false)
		pontos.atualizaPontos(numJogada)
		numJogada += 1
		estado = "mostrandoSeq"
		sequencia.geraSequencia(numJogada)
		sequencia.tocaSequencia()
	
	elif estado=="mostrandoSeq":
		set_process(false)
		estado = "testandoSeq"
		sequencia.resetTimerApertarBotao()

func getEstado():	return estado

func botaoAzulPressionado():
	if sequencia.botaoEstaCorreto("botaoAzul"):
		botaoCorreto()
	else:
		derrota()

func botaoVermelhoPressionado():
	if sequencia.botaoEstaCorreto("botaoVermelho"):
		botaoCorreto()
	else:
		derrota()

func botaoAmareloPressionado():
	if sequencia.botaoEstaCorreto("botaoAmarelo"):
		botaoCorreto()
	else:
		derrota()

func botaoVerdePressionado():
	if sequencia.botaoEstaCorreto("botaoVerde"):
		botaoCorreto()
	else:
		derrota()

func botaoRecomecarPressionado():
	if estado == "terminado":
		RecomecarJogo()

func botaoCorreto():
	if sequencia.getTamSeq() == 0:
		comecaJogo()

func derrota():
	if estado == "testandoSeq":
		estado = "terminado"
		telaDerrota.mostrar(numJogada)

func RecomecarJogo():
	_ready()
	sequencia._ready()
	pontos._ready()
	botaoStart.ativaBotao()

func pausar():
	set_process(false)
	buffer_estado = estado
	estado = "pausado"

func retomar():
	estado = buffer_estado
	set_process(true)
