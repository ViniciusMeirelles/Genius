extends Node

onready var debug_text = get_node("DEBUG TEXT")
onready var genius = get_parent()

func _ready():
	set_process(true)

func _process(delta):
	debug_text.text  = str("DEBUG!\nEstado: ", genius.estado)
	debug_text.text += str("\nSequencia: ", genius.get_node("Sequencia").sequencia)
	debug_text.text += str("\nJogada: ", genius.numJogada)