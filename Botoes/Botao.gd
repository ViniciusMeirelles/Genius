extends Node

onready var luz = get_node("Light2D")
onready var timer_luz = get_node("Timer_luz")
onready var genius = self.owner
var mouse_no_botao = false

signal botaoPressionado


func _ready():
	connect("botaoPressionado", self, "signal_handler")
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("click"):
		pressionaBotao()

func pressionaBotao():
	if mouse_no_botao and !genius.getEstado()=="mostrandoSeq":
		emit_signal("botaoPressionado")
		ligaBotao()


func ligaBotao():
	luz.show()
	timer_luz.start()

func desligaBotao():
	luz.hide()

func mouse_entrou_botao():
	mouse_no_botao = true

func mouse_saiu_botao():
	mouse_no_botao = false