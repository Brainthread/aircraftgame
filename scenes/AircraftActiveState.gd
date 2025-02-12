extends FiniteState

signal performed_rotation
signal changed_throttle

var rotation_speed = 90
var speed = 100

# Called when the node enters the scene tree for the first time.
func _initialize(initializer):
	state_owner = initializer
	pass

func _on_enter():
	print("Entered " + str(self))
	is_active = true
	pass
	
func _on_exit():
	is_active = false
	pass
	
func _on_update(delta):
	if Input.is_action_pressed("Turn right"):
		state_owner.handler.perform_rotation(rotation_speed*delta)
	if Input.is_action_pressed("Turn left"):
		state_owner.handler.perform_rotation(-rotation_speed*delta)
	if Input.is_action_just_pressed("Throttle up"):
		state_owner.handler.update_boost_mode(1)
	if Input.is_action_just_pressed("Throttle down"):
		state_owner.handler.update_boost_mode(-1)
	

func _on_physics_update(delta):
	pass
	
func switch_behaviour(state):
	emit_signal("switch_state", state)
