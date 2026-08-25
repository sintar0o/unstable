extends Control
class_name DialogueBox


#@onready var speaker_label: Label = $SpeakerLabel
@onready var dialogue_text: RichTextLabel = $DialogueText
@export var dialogue_lines:Array[String]
@onready var dialogue_active = false
@onready var current_sentence:String
@onready var sentence_index =0

func _ready() -> void:
	
	
	pass
	
func _process(delta: float) -> void:
	
	pass
	
func dialogue_system() :
	if dialogue_active == true :
		current_sentence =dialogue_lines[sentence_index]
		dialogue_text.text = current_sentence
	if dialogue_active and Input.is_action_just_pressed("advance_dialogue") :
		sentence_index +=1

	pass
