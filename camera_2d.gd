extends Camera2D

var target
var origin_offset = Vector2(580,320)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if target:
		offset = offset.lerp(target.get_global_position(),.15)
	else:
		offset = offset.lerp(origin_offset,.15)


func set_target(target_ref):
	target = target_ref
