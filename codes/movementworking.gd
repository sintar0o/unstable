extends CharacterBody2D

var speed := 50.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var dialogue_bubble: DialogueBox

func _ready() -> void:
	dialogue_bubble.hide()
	
func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO

	if Input.is_key_pressed(KEY_W):
		velocity = Vector2(0, -speed)
		sprite.play("walk up")

	elif Input.is_key_pressed(KEY_A):
		velocity = Vector2(-speed, 0)
		sprite.play("walk_left")

	elif Input.is_key_pressed(KEY_S):
		velocity = Vector2(0, speed)
		sprite.play("walk down")

	elif Input.is_key_pressed(KEY_D):
		velocity = Vector2(speed, 0)
		sprite.play("walk_right")

	else:
		sprite.play("idle")

	move_and_slide()


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	print("area entered: ", area.name)
	if area.is_in_group("npc"):
		print("ogogaga")
	dialogue_bubble.dialogue_active = true
	dialogue_bubble.show()
		
	pass # Replace with function body.
