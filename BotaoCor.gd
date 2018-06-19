extends "res://Botoes/Botao.gd"

func _ready():
	ativaBotao()

func pressionaBotao():
	if mouse_no_botao and genius.getEstado()=="testandoSeq":
		emit_signal("botaoPressionado")
		ligaBotao()