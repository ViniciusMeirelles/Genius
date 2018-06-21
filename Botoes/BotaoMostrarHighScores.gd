extends "res://Botoes/Botao.gd"

func pressionaBotao():
	if mouse_no_botao and (genius.getEstado()=="terminado" or genius.getEstado() == "naoIniciado"):
		emit_signal("botaoPressionado")
		ligaBotao()