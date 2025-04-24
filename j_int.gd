extends Sprite2D

var pressing = false
@onready var parent = $".."
@export var maxLength = 100
@export var deadzone = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pressing:
		if get_global_mouse_position().distance_to(parent.global_position) <= maxLength:
			global_position = get_global_mouse_position()


func _on_button_button_down() -> void:
	pressing = true


func _on_button_button_up() -> void:
	pressing = false
