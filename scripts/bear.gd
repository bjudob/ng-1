extends Animal


func _on_area_2d_body_entered(body: Node2D) -> void:
	Dialogic.start("bear_welcome")
