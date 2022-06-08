start:

//Tamanho do Pássaro
SetSpriteSize(1,51,36) //no menu é 102x72, no jogo é 51x36
SetSpritePosition(1,100,300) //no menu é , no jogo é 100x300

//Física
SetSpritePhysicsOn(1,2) //Ativa Fisica do Pássaro

SetPhysicsGravity(0,300)
SetPhysicsWallBottom(1)

PlayMusic(musicam,1)

//Controles
AddVirtualButton(1,200,300,1000)
SetVirtualButtonVisible(1,0)


//Reset Pontuação
points = 0
pointcon = 1



return
