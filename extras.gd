extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://skate.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_button_3_pressed() -> void:
	$world1.play()
	$world2.stop()
	$world3.stop()
	$world4.stop()
	$world5.stop()
	$world6.stop()


func _on_button_4_pressed() -> void:
	$world1.stop()
	$world2.play()
	$world3.stop()
	$world4.stop()
	$world5.stop()
	$world6.stop()


func _on_button_5_pressed() -> void:
	$world1.stop()
	$world2.stop()
	$world3.play()
	$world4.stop()
	$world5.stop()
	$world6.stop()



func _on_button_6_pressed() -> void:
	$world1.stop()
	$world2.stop()
	$world3.stop()
	$world4.play()
	$world5.stop()
	$world6.stop()


func _on_button_7_pressed() -> void:
	$world1.stop()
	$world2.stop()
	$world3.stop()
	$world4.stop()
	$world5.play()
	$world6.stop()


func _on_button_8_pressed() -> void:
	$world1.stop()
	$world2.stop()
	$world3.stop()
	$world4.stop()
	$world5.stop()
	$world6.play()


func _on_button_9_pressed() -> void:
	$world1.stop()
	$world2.stop()
	$world3.stop()
	$world4.stop()
	$world5.stop()
	$world6.stop()
