extends RigidBody2D

@onready var timer = $Timer

signal dead(projectile_ref)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	print(Vector2(1,0).rotated(rotation))
	
	if Input.is_action_pressed("RMB"):
		apply_impulse(Vector2(1,0).rotated(rotation) * 10, Vector2(-1,0))


func init(impulse_dir:Vector2):
	var impulse_force = 400
	apply_central_impulse(impulse_dir*impulse_force)


func _on_body_entered(body: Node) -> void:
	pass
	#if body.is_in_group("Planet"):
		#queue_free()
	#elif body.is_in_group("Peg"):
		#body.peg_hit()


func _on_timer_timeout() -> void:
	emit_signal("dead", self)
	queue_free()
