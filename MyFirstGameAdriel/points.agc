//Carregar a pontuacao com a fonte

ponto:

LoadFont(2,"flappy-bird-font.ttf")
pontuacao = CreateText("0") 
SetTextFont(pontuacao,2)
SetTextSize(pontuacao,50)
SetTextColor(pontuacao,200,0,100,0)

SetPrintFont(2)
SetPrintSize(50)
SetPrintColor(200,0,100,255)


score = CreateText("Score")
SetTextFont(score,1)
SetTextSize(score,50)
SetTextColor(score,200,0,100,255)
SetTextPosition(score,320,400)
SetTextVisible(score,0)

highscore = CreateText("High Score")
SetTextFont(highscore,1)
SetTextSize(highscore,50)
SetTextColor(highscore,200,0,100,255)
SetTextPosition(highscore,275,300)
SetTextVisible(highscore,0)

return
