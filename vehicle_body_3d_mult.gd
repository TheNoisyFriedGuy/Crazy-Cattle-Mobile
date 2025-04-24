extends VehicleBody3D

var isdead = false
var iswinstate = false
func _enter_tree():
	set_multiplayer_authority(name.to_int())

func bleat():
	if is_multiplayer_authority():
		$Bleat.pitch_scale = randf_range(0.7, 1.3)
		$Bleat.play()


func freeCam():
	if is_multiplayer_authority():
		$Node / Camera3D3 / AudioListener3D.make_current()
		$Node / Camera3D3.make_current()


func win():
	if is_multiplayer_authority():
		$Node / Camera3D3 / freecamlisten / Crowd.play()
		$detect_dead / RichTextLabel5.show()
		freeCam()
		iswinstate = true
		print("You win!")

func _input(event):
	if is_multiplayer_authority():
		if event.is_action_pressed("horn"):
			bleat()
			if isdead == true and iswinstate == false:
				Global.global_sheep = 0
				Global.sheepnum = 0
				Global.eliminated = ""
				get_tree().reload_current_scene()
		elif iswinstate == true:
			get_tree().change_scene_to_file("res://worldmap.tscn")
		if event.is_action_released("horn"):
			$Bleat.stop()
		if event.is_action_pressed("debug_win"):
			win()


var doamovespeed = 100
var won = false


func _physics_process(delta):

	if is_multiplayer_authority():
		var dead = $detect_dead.is_colliding()
		steering = lerp(steering, Input.get_axis("right", "left") * 0.4, 5 * delta)
		engine_force = Input.get_axis("back", "forward") * doamovespeed
		if isdead == false:
			if dead == true and iswinstate == false:
				print("DEAD")
				doamovespeed = 0
				Global.eliminated = "[pulse]" + Global.playername + " has been eliminated."
				$detect_dead / RichTextLabel2.show()
				freeCam()
				$sheep.queue_free()
				$CollisionShape3D.queue_free()
				$Node / Camera3D3 / freecamlisten / Explode.play()
				$Node / Camera3D3 / freecamlisten / explosion.play()
				isdead = true
		if dead == false and Global.global_sheep == 0:
			if won == false:
				win()
				won = true
