extends AudioStreamPlayer

func _process(delta):
	if Global.playWinSound:
		self.stream_paused = false
		await self.finished
	elif not Global.playWinSound:
		self.stream_paused = true
