extends Node
class_name FiniteState

var state_owner = null
var is_active = false
signal switch_state

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
	pass
	
func _on_physics_update(delta):
	pass
	
func switch_behaviour(state):
	emit_signal("switch_state", state)
