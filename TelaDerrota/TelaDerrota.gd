extends Sprite

onready var pontuacaoFinal = get_node("PontuacaoFinal")
onready var botaoRecomecar = get_node("BotaoRecomecar")

func mostrar(numJogada):
	pontuacaoFinal.text = str(numJogada)
	self.show()
	botaoRecomecar.ativaBotao()
	botaoRecomecar.mostraBotao()

func esconder():
	self.hide()
	botaoRecomecar.desativaBotao()
	botaoRecomecar.escondeBotao()