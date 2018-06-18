extends Node

onready var debug_text = get_node("DEBUG TEXT")

func _ready():
	set_process(true)

func _process(delta):
	debug_text.text  = str("DEBUG!\nEstado: ", get_parent().estado)
	debug_text.text += str("\nSequencia: ", get_parent().get_node("Sequencia").sequencia)
	debug_text.text += "\n"