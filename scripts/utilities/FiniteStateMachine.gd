extends Node
class_name FiniteStateMachine

var current_state = null
var states = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var children = get_children()
	states.resize(len(children))
	var i = 0
	for child in children:
		if child is FiniteState:
			states[i] = child
			states[i]._initialize(self)
			states[i].switch_state.connect(_on_state_change)
		i += 1
		
	if current_state == null:
		current_state = states[0]
		print(current_state)
	current_state._on_enter()
			

func _process(delta: float):
	if current_state != null:
		current_state._on_update(delta)

func _physics_process(delta: float):
	if current_state != null:
		current_state._on_physics_update(delta)

func _on_state_change(target_state):
	print("Signal Received")
	_change_state(target_state)


func _change_state(target_state):
	if current_state != null:
		current_state._on_exit()
	if target_state != null:
		target_state._on_enter()
		current_state = target_state
