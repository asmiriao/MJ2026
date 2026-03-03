class_name MaskEvaluatorClass extends Node

# 1. Stores player selected mask
# 2. Stores Soul owned mask
# 3. Evaluates if it's the same or not
# 4. Returns result true of false, being true the right mask selected, false the wrong one

var soul_owned_mask : String

func mask_selected_compare(player_selected_mask : String) -> bool:
	return player_selected_mask == soul_owned_mask
