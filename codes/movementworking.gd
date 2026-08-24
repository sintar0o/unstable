extends CharacterBody2D

var speed := 50.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var dialogue_bubble: Control

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO

	if Input.is_key_pressed(KEY_W):
		velocity = Vector2(0, -speed)
		sprite.play("walk_up")

	elif Input.is_key_pressed(KEY_A):
		velocity = Vector2(-speed, 0)
		sprite.play("walk_left")

	elif Input.is_key_pressed(KEY_S):
		velocity = Vector2(0, speed)
		sprite.play("walk_down")

	elif Input.is_key_pressed(KEY_D):
		velocity = Vector2(speed, 0)
		sprite.play("walk_right")

	else:
		sprite.play("idle")

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("npc"):
		Dialogue_bubble.show()
	pass # Replace with function body.
