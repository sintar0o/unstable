# DialogueInteractable.gd
extends Node2D

@export_group("Dialogue")
@export var speaker_name: String = "Trader"
@export var dialogue_lines: Array[String] = []
@export var dialogue_box:Control

func interact() -> void:
	dialogue_box.start_dialogue( dialogue_lines)
