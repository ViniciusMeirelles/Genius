extends Sprite

onready var pontuacaoFinal = get_node("PontuacaoFinal")
onready var botaoRecomecar = get_node("BotaoRecomecar")
onready var highScores = get_tree().get_root().get_node("Genius/TelaHighScores")
onready var nomeJogador = get_node("NomeJogador")

var pontuacao = 0

func mostrar(numJogada):
	pontuacao = numJogada-1
	pontuacaoFinal.text = str(pontuacao)
	self.show()
	botaoRecomecar.ativaBotao()
	botaoRecomecar.mostraBotao()
	nomeJogador.text = ""

func esconder():
	self.hide()
	botaoRecomecar.desativaBotao()
	botaoRecomecar.escondeBotao()

func nomeInserido(nome):
	highScores.comparaPontuacao(pontuacao, nome)