extends "res://Botoes/Botao.gd"

onready var spriteMudo = get_node("mudo")
onready var sliderVolume = get_parent().get_node("VSlider")

func mute():
	pass

func pressionaBotao():
	if mouse_no_botao:
		emit_signal("botaoPressionado")
		ligaBotao()

func mudo():
	get_tree().call_group("Botoes", "mute")
	mudaSprite()

func mudaSprite():
	print("visibilidade: ", spriteMudo.is_visible_in_tree())
	if spriteMudo.is_visible_in_tree():	spriteMudo.hide()
	else:	spriteMudo.show()
