extends Node

onready var texto = get_node("Texto")
onready var telaDerrota = get_node("TelaDerrota")
onready var pontuacaoFinalTexto = get_node("TelaDerrota/PontuacaoFinal")

export var textoHighScore = "High Score: "
export var textoPontuacao = "Pontuação:  "

var saveFile = File.new()
var highScore
var pontuacaoAtual

func _ready():
	highScore = 0
	pontuacaoAtual = 0
	carregaJogo()
	atualizaTexto()


func atualizaPontos(jogada):
	pontuacaoAtual = jogada
	verificaHighScore()
	atualizaTexto()

func verificaHighScore():
	if pontuacaoAtual > highScore:
		highScore = pontuacaoAtual
		salvaJogo()

func atualizaTexto():
	texto.text = textoHighScore + str(highScore)
	texto.text += "\n" + textoPontuacao + str(pontuacaoAtual)

func getPontos():
	return pontuacaoAtual


func salvaJogo():
	saveFile.open("user://save.save", File.WRITE)
	saveFile.store_line(str(highScore))
	saveFile.close()

func carregaJogo():
	saveFile.open("user://save.save", File.READ)
	highScore = int(saveFile.get_line())
	saveFile.close()
