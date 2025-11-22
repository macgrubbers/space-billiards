extends Node2D

@onready var camera = $Camera2D
@onready var player_slingshot = $PlayerSlingshot

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("post_ready")


func post_ready():
	player_slingshot.connect("just_shot", player_just_shot)
	print(player_slingshot)


func player_just_shot(bullet_ref):
	print("shot")
	camera.set_target(bullet_ref)
