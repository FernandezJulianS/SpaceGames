extends Area2D

export(int)var Velocidad
var Mov = Vector2()
var limite
signal golpe


func _ready():
	hide()
	limite = get_viewport_rect().size #limites de la ventana
	

func _process(delta):
	Mov = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		Mov.x += 1
	if Input.is_action_pressed("ui_left"):
		Mov.x -= 1
	if Input.is_action_pressed("ui_up"):
		Mov.y -= 1
	if Input.is_action_pressed("ui_down"):
		Mov.y += 1
	
	if Mov.length() > 0:
		Mov = Mov.normalized() * Velocidad
	
	position += Mov * delta
	position.x = clamp(position.x, 0, limite.x )
	position.y = clamp(position.y, 0, limite.y )
	
	if Mov.x != 0:
		$Spr_player.animation = "L_Derecho"
		$Spr_player.flip_h = Mov.x < 0
		#$Spr_player.flip_v = false
	elif Mov.y != 0:
		$Spr_player.animation = "Espalda"
		$Spr_player.flip_v = Mov.y > 0
	else:
		$Spr_player.animation = "Frente"
		$Spr_player.flip_v = Mov.y #invierte la imagen cuando el mov.y es 0

func _on_Player_body_entered(body):
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true
	
func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
