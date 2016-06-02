
extends RigidBody2D

var p_anim

func _ready():
	p_anim = get_node("p-frente-animation")
	show_frente()
	
	set_fixed_process(true)
	
func _fixed_process(delta):
	if !p_anim.is_playing():
		if is_stopped():
			p_anim.play("p-frente")
		else:
			p_anim.play("p-frente-andando")
	
	if Input.is_action_pressed("ui_up"):
		set_pos(Vector2(get_pos().x, get_pos().y-1))
		show_costas()
	if Input.is_action_pressed("ui_down"):
		set_pos(Vector2(get_pos().x, get_pos().y+1))
		show_frente()
	if Input.is_action_pressed("ui_left"):
		set_pos(Vector2(get_pos().x-1, get_pos().y))
		get_node('p-frente-andando').show()
		get_node('p-frente').hide()
	if Input.is_action_pressed("ui_right"):
		set_pos(Vector2(get_pos().x+1, get_pos().y))
		get_node('p-frente-andando').show()
		get_node('p-frente').hide()
		
func show_costas():
	get_node('p-frente').hide()
	get_node('p-frente-andando').hide()
	get_node('p-costas').show()	
	
func show_frente():
	get_node('p-frente').show()
	get_node('p-frente-andando').hide()
	get_node('p-costas').hide()
	
func is_moving():
	if(Input.is_action_pressed("ui_up") or
	Input.is_action_pressed("ui_down") or
	Input.is_action_pressed("ui_left") or
	Input.is_action_pressed("ui_right")):
		return true
	else:
		return false
	
func is_stopped():
	return !is_moving()