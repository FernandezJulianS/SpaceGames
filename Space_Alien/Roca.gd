extends RigidBody2D

export(int)var Velocidad_min
export(int)var Velocidad_max
var Tipo_roca = ["R_big","R_small"]

func _ready():
	$Sprt_Roca.animation = Tipo_roca[randi()% Tipo_roca.size()]
	
	if $Sprt_Roca.animation == "R_small":
		$CollisionShape2D.scale.x = 1
		$CollisionShape2D.scale.y = 1.5



func _on_Visibilidad_screen_exited():
	queue_free() #eliminar roca.
