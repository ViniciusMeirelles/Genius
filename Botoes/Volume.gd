extends Node

func setVolume(volume):
	get_tree().call_group("Botoes", "setVolume", volume)