extends Node

onready var somBotaoVerm = get_parent().get_node("BotaoVermelho/AudioStreamPlayer")
onready var somBotaoVerd = get_parent().get_node("BotaoVerde/AudioStreamPlayer")
onready var somBotaoAm = get_parent().get_node("BotaoAmarelo/AudioStreamPlayer")
onready var somBotaoAz = get_parent().get_node("BotaoAzul/AudioStreamPlayer")
onready var somBotaoStart = get_parent().get_node("BotaoStart/AudioStreamPlayer")
onready var botaoVoltar = get_node("BotaoVoltar")

func _ready():
	esconder()

func mostrar():
	get_tree().call_group("ui_config", "show")
	botaoVoltar.mostraBotao()
	botaoVoltar.ativaBotao()

func esconder():
	get_tree().call_group("ui_config", "hide")
	botaoVoltar.escondeBotao()
	botaoVoltar.desativaBotao()


func novoCaminhoVerm(caminho):
	if File.new().file_exists(caminho):
		var novoSom = load(caminho)
		novoSom.set_loop(false)
		somBotaoVerm.stream = novoSom

func novoCaminhoVerd(caminho):
	if File.new().file_exists(caminho):
		var novoSom = load(caminho)
		novoSom.set_loop(false)
		somBotaoVerd.stream = novoSom

func novoCaminhoAm(caminho):
	if File.new().file_exists(caminho):
		var novoSom = load(caminho)
		novoSom.set_loop(false)
		somBotaoAm.stream = novoSom

func novoCaminhoAz(caminho):
	if File.new().file_exists(caminho):
		var novoSom = load(caminho)
		novoSom.set_loop(false)
		somBotaoAz.stream = novoSom

func novoCaminhoStart(caminho):
	print("ENTROU")
	if File.new().file_exists(caminho):
		print("ENTROU NO IF")
		var novoSom = load(caminho)
		somBotaoStart.stream = novoSom
