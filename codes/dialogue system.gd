extends Control
class_name DialogueBox


#@onready var speaker_label: Label = $SpeakerLabel
@export var Npc_dialogue: Npc_dia
@onready var dialogue_text: RichTextLabel = $MarginContainer/PanelContainer/ScrollContainer/RichTextLabel
@onready var dialogue_lines 
@onready var dialogue_active = false
@onready var current_sentence:String
@onready var sentence_index =0
@onready var scrollcontainer = $MarginContainer/PanelContainer/ScrollContainer


	

func _process(delta: float) -> void:
	dialogue_system()

	
func dialogue_system() -> void:
	dialogue_lines = Npc_dialogue.sentences_by_npc
	if not dialogue_active:
		return
	current_sentence = dialogue_lines[sentence_index]
	dialogue_text.text = current_sentence
	if Input.is_action_just_pressed("advance_dialogue"):
		sentence_index += 1
		if sentence_index >= dialogue_lines.size():
			dialogue_active = false
			sentence_index = 0
			hide()
