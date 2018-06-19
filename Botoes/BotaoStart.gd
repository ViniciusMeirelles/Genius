extends "res://Botoes/Botao.gd"

func _ready():
	ativaBotao()
	set_process_input(true)

func pressionaBotao():
	if mouse_no_botao and !genius.getEstado()=="mostrandoSeq":
		emit_signal("botaoPressionado")
		ligaBotao()