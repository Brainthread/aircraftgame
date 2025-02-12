extends Node2D
class_name PlayerAircraft

signal player_rotation_set
signal player_fired_weapon
signal player_died
signal player_healed
signal player_speed_set
signal player_boost_mode_updated

@export var movement_speeds = [5, 300, 800] 
@export var rotation_speeds = [180, 90, 45] 
@export var speed_change_delta = [100, 500, 300]
@export var rotation_speed_change_delta = [100, 100, 100] 

var current_mode = 1
var current_speed = 0
var current_rotation_speed = 90

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_boost_mode(amount):
	if sign(amount) > 0 && current_mode < 2:
		current_mode += amount
	if sign(amount) < 0 && current_mode > 0:
		current_mode -= amount

func set_player_speed(amount):
	emit_signal("player_speed_set", amount)

func perform_rotation(amount):
	rotation += deg_to_rad(amount)
	emit_signal("player_rotation_set", rotation)
