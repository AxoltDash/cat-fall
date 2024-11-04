extends CanvasLayer

func _process(_delta):
	%Credits.text = "LIVES: " + str(GLOBAL.credits)
	%Score.text = "SCORE: " + str(GLOBAL.score)
