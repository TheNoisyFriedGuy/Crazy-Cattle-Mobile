extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_unlock_pressed() -> void:
	var data = SaveData.new()
	Global.unlockedlevels = 3
	Global.beatenlevels = 3
	data.saveunlockedlevels = Global.unlockedlevels
	ResourceSaver.save(data, "user://savefile.tres")


func _on_unlock_button_down() -> void:
	$Node/Uipress.play()

func _on_unlock_button_up() -> void:
	$Node/Uihover.play()
