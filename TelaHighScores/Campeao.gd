extends Node

var nome = ""
var pontuacao = 0

func getNome():
	return nome

func setNome(novoNome):
	nome = novoNome

func getPontuacao():
	return pontuacao

func setPontuacao(novaPontuacao):
	pontuacao = novaPontuacao

func novoCampeao(novaPontuacao, novoNome):
	return self
