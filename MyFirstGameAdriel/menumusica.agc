//disponibilizar o menu da musica

menumusica:

// Criar botoes de play
mplay1 =CreateSprite(LoadImage("play-button.png"))
SetSpriteSize(mplay1,50,50)
SetSpritePosition(mplay1,350,290)
SetSpriteColor(mplay1,255,255,255,255)

mplay2 =CreateSprite(LoadImage("play-button.png"))
SetSpriteSize(mplay2,50,50)
SetSpritePosition(mplay2,350,370)
SetSpriteColor(mplay2,255,255,255,255)

mplay3 =CreateSprite(LoadImage("play-button.png"))
SetSpriteSize(mplay3,50,50)
SetSpritePosition(mplay3,350,450)
SetSpriteColor(mplay3,255,255,255,255)


//Criar texto
music1 = CreateText("Menu")
SetTextSize(music1,60)
SetTextFont(music1,1)
SetTextPosition(music1,410,290)
SetTextColor (music1,200,0,100,255)

music2 = CreateText("Inicio")
SetTextSize(music2,60)
SetTextFont(music2,1)
SetTextPosition(music2,410,370)
SetTextColor (music2,200,0,100,255)

music3 = CreateText("Fim")
SetTextSize(music3,60)
SetTextFont(music3,1)
SetTextPosition(music3,410,450)
SetTextColor (music3,200,0,100,255)


//Se clicar

if GetPointerReleased()
	
	if GetSpriteHitTest(mplay1,GetPointerX(),GetPointerY())
		StopMusic()
		PlayMusic(musicam,0)
		SetMusicFileVolume(musicam,15)
			
	elseif GetSpriteHitTest(mplay2,GetPointerX(),GetPointerY())
		StopMusic()
		PlayMusic(musica2,1)
		SetMusicFileVolume(musica2,15)
		
	elseif GetSpriteHitTest(mplay3,GetPointerX(),GetPointerY())
		StopMusic()
		PlayMusic(musica3,1)
		SetMusicFileVolume(musica3,15)
	endif
endif


return

