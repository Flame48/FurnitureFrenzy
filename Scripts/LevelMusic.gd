extends AudioStreamPlayer

func _process(delta):
	if Global.playMenuMusic:
		self.stream_paused = true
	elif Global.playLevelMusic:
		self.stream_paused = false
