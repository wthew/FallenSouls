extends Node3D

var player
@export var sensitivity := 0.005


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position = player.global_position
	$SpringArm3D/Camera3D.look_at(player.get_node("LookAt").global_position)


func _input(event):
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * sensitivity
		rotation.x = clamp(rotation.x - event.relative.y * sensitivity, -1, 0.5)
