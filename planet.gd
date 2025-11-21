extends RigidBody2D

@export var mesh_radius : float = 10
@export var gravity_radius : float = 100
@export var gravity_magnitude : float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MeshInstance2D.mesh.set_radius(mesh_radius)
	$MeshInstance2D.mesh.set_height(mesh_radius * 2)
	$CollisionShape2D.shape.set_radius(mesh_radius)
	$GravityArea2D.set_gravity(980 * gravity_magnitude)
	$GravityArea2D.set_gravity_point_unit_distance(mesh_radius)
	$GravityArea2D/CollisionShape2D.shape.set_radius(gravity_radius)
