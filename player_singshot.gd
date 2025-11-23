extends Node2D



# State machine
enum States{IDLE, READY}
var current_state = States.READY

@onready var shooter = $Shooter
@onready var barrel = $Shooter/Barrel
@onready var projectile = preload("res://PlayerProjectile.tscn")

signal just_shot(bullet_ref)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if current_state == States.READY:
		look_at(get_global_mouse_position())



func _input(event: InputEvent) -> void:
	if current_state == States.READY:
		if Input.is_action_just_released("LMB"):
			current_state = States.IDLE
			var new_projectile = projectile.instantiate()
			get_tree().root.add_child(new_projectile)
			new_projectile.set_position(barrel.get_global_position())
			
			# Apply a force in the direction of the mouse
			var aim_direction = get_global_position().direction_to(get_global_mouse_position())
			new_projectile.init(aim_direction)
			
			emit_signal("just_shot", new_projectile)


func fire()->void:
	pass	


func rearm()->void:
	current_state = States.READY
