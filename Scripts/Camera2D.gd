extends Camera2D

var ssCount = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = DirAccess.open("res://")
	dir.make_dir("screenshots")
	
	dir = DirAccess.open("user://screenshots")
	for n in dir.get_files():
		ssCount += 1
		
func _input(event):
	if event.is_action_pressed("screenshot"):
		screenshot()
	
func screenshot():
	await RenderingServer.frame_post_draw
	
	var viewport = get_viewport()
	var img = viewport.get_texture().get_image()
	img.save_png("res://screenshots/ss" + str(ssCount) + ".png")
	ssCount += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
