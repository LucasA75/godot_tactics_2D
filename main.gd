extends Node2D

@onready var tile_map = $TileMapLayer
@onready var player = $CharacterBody2D

var tiles_permises = [[0,0],[0,3]]

func _ready() -> void:
	pass

func handle_click_event(position_cell):

	print("Presionaste la tecla")
	print(position_cell)
	var global_position = tile_map.map_to_local(position_cell) + (tile_map.position + Vector2(0,-7))
	print(tile_map.map_to_local(position_cell))
	print(tile_map.position)
	player.position = global_position
	pass
	
func _process(delta: float) -> void:
	var clicked_cell = tile_map.local_to_map(tile_map.get_local_mouse_position())
	var data = tile_map.get_cell_atlas_coords(clicked_cell)
	#print(data)
	if Input.is_action_just_pressed("click_left"):
		print(verify_cell(data))
		if(verify_cell(data)):
			handle_click_event(clicked_cell)
	pass
	
func verify_cell(data_cell) -> bool:
	for value in tiles_permises:
		print(value)
		if data_cell == Vector2i(value[0],value[1]):
			return true
	return false
	pass
