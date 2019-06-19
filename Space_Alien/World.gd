extends Node
export (PackedScene) var Roca
var Socore

func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$Player.inicio($Position_B.position) # posicion de inicio del jugador
	$B_Timer.start()


func Game_Over():
	 $Sc_Timer.stop()
	 $R_Timer.stop()


func _on_B_Timer_timeout():
	$R_Timer.start()
	$Sc_Timer.start()


func _on_Sc_Timer_timeout():
	Score += 1


func _on_R_Timer_timeout():
	# Seleccionar un lugar aleatorio en el camino/path
	 $Camino/Roca_Pos.set_offset(randi())
	
	
	
	
	
	
	
	
	
	
	
	
