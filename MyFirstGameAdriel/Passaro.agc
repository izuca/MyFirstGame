passarinho:
CreateSprite(1,0)

AddSpriteAnimationFrame ( 1, LoadImage ( "bird1.png" ) )
AddSpriteAnimationFrame ( 1, LoadImage ( "bird2.png" ) )
AddSpriteAnimationFrame ( 1, LoadImage ( "bird3.png" ) )

PlaySprite(1,10,1,1,3)

SetSpriteSize(1,102,72) //no menu é 102x72, no jogo é 51x36
SetSpritePosition(1,100,300) //no menu é , no jogo é 100x300

return
