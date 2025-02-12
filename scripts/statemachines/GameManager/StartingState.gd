extends FiniteState
class_name StartingState

# Called when the node enters the scene tree for the first time.
func _initialize(initializer):
	state_owner = initializer
	pass

func _on_enter():
	print("Entered " + str(self))
	is_active = true
	switch_behaviour($"../GameState")
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
