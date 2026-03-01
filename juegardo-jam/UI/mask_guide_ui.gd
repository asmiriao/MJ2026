extends CanvasLayer

@export var pages: Array[Texture2D]
var current_page_index : int = 0

@onready var guide_container = $guide_container
@onready var guide_toggle = $guide_toggle
@onready var next_page_button = $guide_container/next_button
@onready var prev_page_button = $guide_container/prev_button
@onready var close_button = $guide_container/close_button
@onready var page_display : TextureRect = $guide_container/page_display


func _on_guide_toggle_pressed() -> void:
	update_page_display()
	check_for_button_visibility()
	guide_container.visible = true

func _on_close_button_pressed() -> void:
	guide_container.visible = false


func _on_next_button_pressed() -> void:
	update_current_page_index(1)
	update_page_display()

func _on_prev_button_pressed() -> void:
	update_current_page_index(-1)
	update_page_display()

# Changes the texture of the mask guide page
func update_page_display():
	page_display.texture = pages[current_page_index]

# Updates the value of the current page safely
func update_current_page_index(value : int) -> void:
	current_page_index += value
	current_page_index = clampi(current_page_index, 0, pages.size() - 1)
	check_for_button_visibility()
	
func check_for_button_visibility() -> void:
	# Check for prev_button disabling
	prev_page_button.disabled = (current_page_index == 0)
	# Check for next_button disabling
	next_page_button.disabled = (current_page_index == pages.size() - 1)
