extends Node

onready var fundo = get_node("Fundo")
onready var ranking = get_node("Ranking")
onready var titulo = get_node("Titulo")
onready var botaoVoltar = get_node("BotaoVoltar")
onready var genius = get_tree().get_root().get_node("Genius")
onready var pontos = genius.get_node("Pontos")

var nomesHighScores = Array()
var pontuacoesHighScores = Array()
var saveFile = File.new()

func _ready():
	esconder()
	carregaJogo()

func esconder():
	fundo.hide()
	ranking.hide()
	titulo.hide()
	botaoVoltar.escondeBotao()
	botaoVoltar.desativaBotao()
	genius.retomar()

func mostrar():
	fundo.show()
	ranking.show()
	titulo.show()
	botaoVoltar.mostraBotao()
	botaoVoltar.ativaBotao()
	genius.pausar()


func comparaPontuacao(pontuacao, nome):
	if pontuacao > 0:
		print("SIM!")
		print("pontuacao: ", pontuacao, "\nnome: ", nome)
		var posicao = 0
		var novoHighScore = false
		
		if pontuacoesHighScores.size() < 10:
			novoHighScore = true
			posicao = pontuacoesHighScores.size()
		
		# Descobre a posição do novo jogador, caso tenha batido um high score
		for i in range (pontuacoesHighScores.size()):
			print("comparando ", pontuacao, " com ", pontuacoesHighScores[i])
			if pontuacao > pontuacoesHighScores[i]:
				posicao = i
				novoHighScore = true
				break
		# Caso bateu um high score, coloca o novo jogador na devida posição
		if novoHighScore:
			print("posicao: ", posicao)
			pontuacoesHighScores.insert(posicao, pontuacao)
			nomesHighScores.insert(posicao, nome)
		
		if pontuacoesHighScores.size() > 10:
			pontuacoesHighScores.resize(10)
		
		atualizaTexto()
		salvaJogo()


func salvaJogo():
	var bufferPontuacoesHighScores = pontuacoesHighScores.duplicate()
	var bufferNomesHighScores = nomesHighScores.duplicate()
	
	saveFile.open("user://save.save", File.WRITE)
	for i in range(pontuacoesHighScores.size()):
		saveFile.store_line(str(pontuacoesHighScores.pop_front()))
		saveFile.store_line(nomesHighScores.pop_front())
	
	pontuacoesHighScores = bufferPontuacoesHighScores.duplicate()
	nomesHighScores = bufferNomesHighScores.duplicate()
	
	saveFile.close()

func carregaJogo():
	saveFile.open("user://save.save", File.READ)
	for i in range(10):
		pontuacoesHighScores.push_back(int(saveFile.get_line()))
		if saveFile.eof_reached():
			pontuacoesHighScores.pop_back()
			break
		nomesHighScores.push_back(saveFile.get_line())
		if saveFile.eof_reached():	break
	saveFile.close()
	# Atualiza a visualização do maior high score durante o jogo
	if pontuacoesHighScores.size() > 0:
		pontos.verificaHighScore(pontuacoesHighScores[0])
	atualizaTexto()

func atualizaTexto():
	ranking.text = ""
	for i in range(pontuacoesHighScores.size()):
		ranking.text += str(i, ".\t", pontuacoesHighScores[i], "\t", nomesHighScores[i], "\n")
