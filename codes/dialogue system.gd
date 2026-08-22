# DialogueBox.gd
class_name DialogueBox
extends Control

@onready var speaker_label: Label = $SpeakerLabel
@onready var dialogue_text: RichTextLabel = $DialogueText

var current_lines: Array[String] = []
var line_index := 0
var dialogue_active := false

func _ready() -> void:
	hide()

func start_dialogue(new_speaker: String, new_lines: Array[String]) -> void:
	if new_lines.is_empty():
		return

	speaker_label.text = new_speaker
	current_lines = new_lines
	line_index = 0
	dialogue_active = true
	show()
	show_current_line()

func _process(delta: float) -> void:
	if dialogue_active and Input.is_action_just_pressed("advance_dialogue"):
		advance_dialogue()

func show_current_line() -> void:
	dialogue_text.text = current_lines[line_index]

func advance_dialogue() -> void:
	if line_index < current_lines.size() - 1:
		line_index += 1
		show_current_line()
	else:
		dialogue_active = false
		hide()
