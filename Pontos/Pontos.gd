extends Node

onready var texto = get_node("Texto")
onready var telaDerrota = get_node("TelaDerrota")
onready var pontuacaoFinalTexto = get_node("TelaDerrota/PontuacaoFinal")

export var textoHighScore = "High Score: "
export var textoPontuacao = "Pontuação:  "

var highScore
var pontuacaoAtual

func _ready():
	highScore = 0
	pontuacaoAtual = 0
	atualizaTexto()


func atualizaPontos(jogada):
	pontuacaoAtual = jogada
	verificaHighScore(pontuacaoAtual)

func verificaHighScore(pontuacao):
	if pontuacao > highScore:
		highScore = pontuacao
	atualizaTexto()

func atualizaTexto():
	texto.text = textoHighScore + str(highScore)
	texto.text += "\n" + textoPontuacao + str(pontuacaoAtual)

func getPontos():
	return pontuacaoAtual
