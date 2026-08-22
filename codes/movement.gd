extends Node2D

var speed = 50;

@onready var sprite = $CharacterBody2D/AnimatedSprite2D
@export var Dialogue_bubble : Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if Input.is_key_pressed(KEY_W):
		self.position.y -= speed * delta
		sprite.play("walk up")
		
	
	elif Input.is_key_pressed(KEY_A):
		self.position.x -= speed * delta
		sprite.play("walk_left")
		
	
	elif Input.is_key_pressed(KEY_S):
		self.position.y += speed * delta
		sprite.play("walk down")
		
	
	elif Input.is_key_pressed(KEY_D):
		self.position.x += speed * delta
		sprite.play("walk_right")
		
	else :
		sprite.play("idle")
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("npc"):
		Dialogue_bubble.show()
	pass # Replace with function body.
