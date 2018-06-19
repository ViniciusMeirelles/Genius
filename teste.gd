extends Node

onready var debug_text = get_node("DEBUG TEXT")
onready var genius = get_parent()
onready var timerBotao = get_parent().get_node("Sequencia/TempoApertarBotao")

func _ready():
	set_process(true)

func _process(delta):
	debug_text.text  = str("DEBUG!\nEstado: ", genius.estado)
	debug_text.text += str("\nSequenciaAtual: ", genius.get_node("Sequencia").sequenciaAtual)
	debug_text.text += str("\nUltimaSequencia: ", genius.get_node("Sequencia").ultimaSequencia)
	debug_text.text += str("\nJogada: ", genius.numJogada)
	debug_text.text += str("\nTempo restante: ", timerBotao.time_left)