extends Control
var socket

func _ready():
	socket = StreamPeerTCP.new()
#	$buttonConnect.connect("pressed",self,"_on_connect")
#	$buttonMessage.connect("pressed",self,"_on_message")
	socket.connect_to_host("127.0.0.1", 4242)
#	socket.put_data("myMessage2; banana;".to_ascii())

#func _on_connect():
#	socket.connect_to_host("127.0.0.1", 4242)

func _on_chord1likelihood_value_changed(value):
	socket.put_data("chord1likelihood;".to_ascii())

func _on_chord2likelihood_value_changed(value):
	socket.put_data("chord2likelihood;".to_ascii())

func _on_multioscdecaytime_value_changed(value):
	socket.put_data("multioscdecaytime;".to_ascii())

func _on_multioscwahwah_value_changed(value):
	socket.put_data("multioscwahwah;".to_ascii())

func _on_multioscvolume_value_changed(value):
	socket.put_data("multioscvolume;".to_ascii())

func _on_MOdurationsButton_pressed():
	var MOdurations = get_parent().get_node("MOdurationsTxt").text
	get_tree().multiplayer.send_bytes(MOdurations.to_ascii())
	socket.put_data(MOdurations.to_ascii())

func _on_return_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/main.tscn")
