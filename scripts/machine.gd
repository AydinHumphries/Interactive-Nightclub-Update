extends CollisionShape

func _on_shape_tree_entered():
	print("entered")
	get_tree().change_scene("machine.tscn")
