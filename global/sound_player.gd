extends Node

func play(audio: AudioStream, single=false) -> void:
	if not audio:
		return
		
	if single:
		stop()
	
	for player: AudioStreamPlayer in get_children():
		if player.stream == audio and player.playing:
			return  # If the same audio is already playing, do not restart it
		elif not player.playing:
			player.stream = audio
			player.play()
			break

func stop() -> void:
	for player: AudioStreamPlayer in get_children():
		player.stop()
