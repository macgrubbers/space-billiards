extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	pass


func init(impulse_dir:Vector2):
	var impulse_force = 400
	apply_central_impulse(impulse_dir*impulse_force)
	


func _on_body_entered(body: Node) -> void:
	pass
	#if body.is_in_group("Planet"):
		#queue_free()
	#elif body.is_in_group("Peg"):
		#body.peg_hit()
