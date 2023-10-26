extends AudioStreamPlayer

func _process(delta):
	if Global.playLevelMusic:
		self.stream_paused = true
	elif Global.playMenuMusic:
		self.stream_paused = false
