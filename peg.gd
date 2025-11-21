extends RigidBody2D

var hit : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toggle_freeze()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func peg_hit():
	print("HIT")
	hit = true
	queue_free()
	#call_deferred("toggle_freeze")
	
func toggle_freeze():
	if freeze:
		freeze = false
	else:
		freeze = true
