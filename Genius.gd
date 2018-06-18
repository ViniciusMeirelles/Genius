extends Node

onready var sequencia = get_node("Sequencia")
onready var telaDerrota = get_node("TelaDerrota")

#var esperandoJogador = true
var estado = "naoIniciado" #naoIniciado, mostrandoSeq, testandoSeq, terminado
var podeTrocarEstado = true
var numJogada = 0

export var tempo_espera = 1.5

func _ready():
	set_process(false)

func comecaJogo():
		set_process(true)

func _process(delta):
	controlaJogo()

func controlaJogo():
	if estado=="naoIniciado" or estado=="testandoSeq":
		set_process(false)
		numJogada += 1
		estado = "mostrandoSeq"
		sequencia.geraSequencia(numJogada)
		sequencia.tocaSequencia()
	
	elif estado=="mostrandoSeq":
		set_process(false)
		estado = "testandoSeq"

func getEstado():	return estado

func botaoAzulPressionado():
	if sequencia.botaoEstaCorreto("botaoAzul"):
		botaoCorreto()
	else:
		botaoErrado()

func botaoVermelhoPressionado():
	if sequencia.botaoEstaCorreto("botaoVermelho"):
		botaoCorreto()
	else:
		botaoErrado()

func botaoAmareloPressionado():
	if sequencia.botaoEstaCorreto("botaoAmarelo"):
		botaoCorreto()
	else:
		botaoErrado()

func botaoVerdePressionado():
	if sequencia.botaoEstaCorreto("botaoVerde"):
		botaoCorreto()
	else:
		botaoErrado()

func botaoCorreto():
	if sequencia.getTamSeq() == 0:
		comecaJogo()

func botaoErrado():
	if estado == "testandoSeq":
		estado = "terminado"
		telaDerrota.show()