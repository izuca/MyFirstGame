//disponibilizar o menu do som

menusons:

// Criar botoes de play
SetSpriteColorAlpha(botaoplay1,255)
SetSpriteColorAlpha(botaoplay2,255)
SetSpriteColorAlpha(botaoplay3,255)

SetTextColorAlpha(pontomenu,255)
SetTextColorAlpha(pulomenu,255)
SetTextColorAlpha(mortemenu,255)


//Se clicar

if GetPointerReleased()
	
	if GetSpriteHitTest(botaoplay1,GetPointerX(),GetPointerY())
		PlaySound(pontosfx,50)
		
		StopMusic()
		
	elseif GetSpriteHitTest(botaoplay2,GetPointerX(),GetPointerY())
		PlaySound(voandosfx,50)
		
		StopMusic()
		
	elseif GetSpriteHitTest(botaoplay3,GetPointerX(),GetPointerY())
		PlaySound(mortesfx,50)
		
		StopMusic()
		
	endif
endif


return
