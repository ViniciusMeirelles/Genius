extends Node

onready var luz = get_node("Light2D")
onready var timer_luz = get_node("Timer_luz")
onready var som = get_node("AudioStreamPlayer")
onready var colisor = get_node("Area2D")
onready var sprite = get_node("Sprite")
onready var genius = get_tree().get_root().get_node("Genius")

var mouse_no_botao = false
var buffer_volume = 0

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
	som.play()
	luz.show()
	timer_luz.start()

func desligaBotao():
	luz.hide()

func mute():
	# unmute
	if som.volume_db==-60:
		som.volume_db = buffer_volume
	# mute
	else:
		buffer_volume = som.volume_db
		som.volume_db = -60

func setVolume(volume):
	som.volume_db = volume

func mouse_entrou_botao():
	mouse_no_botao = true

func mouse_saiu_botao():
	mouse_no_botao = false

func desativaBotao():
	colisor.set_collision_layer_bit(0, 0)

func ativaBotao():
	colisor.set_collision_layer_bit(0, 1)

func escondeBotao():
	sprite.hide()

func mostraBotao():
	sprite.show()
