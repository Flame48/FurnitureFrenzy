extends AudioStreamPlayer

func _process(delta):
	if Global.playWinSound:
		self.stream_paused = false
	elif not Global.playWinSound:
		self.stream_paused = true
