extends Area2D

@export var speed = 50
@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer

func _process(delta):
	# Defino o vetor de açao de acordo com a açao pressionada
	var input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if input_vector == Vector2.ZERO:
		animation_player.play("Idle")
	else:
		animation_player.play("Running")
		if input_vector.x != 0:
			sprite_2d.scale.x = sign(input_vector.x)
	
	# Multiplicamos por delta para que o movimento utilize tempo real e nao tempo da maquina
	position += input_vector * speed * delta
	
	


func _on_area_entered(area):
	area.queue_free()
	scale *= 1.1
