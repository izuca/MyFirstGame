#include "menu2.agc"
Menu:
LoadFont(1,"FlappyBirdy.ttf")
botaoplay1 =CreateSprite(LoadImage("play-button.png"))
SetSpriteSize(botaoplay1,50,50)
SetSpritePosition(botaoplay1,350,290)
SetSpriteColor(botaoplay1,255,255,255,0)

botaoplay2 =CreateSprite(LoadImage("play-button.png"))
SetSpriteSize(botaoplay2,50,50)
SetSpritePosition(botaoplay2,350,370)
SetSpriteColor(botaoplay2,255,255,255,0)

botaoplay3 =CreateSprite(LoadImage("play-button.png"))
SetSpriteSize(botaoplay3,50,50)
SetSpritePosition(botaoplay3,350,450)
SetSpriteColor(botaoplay3,255,255,255,0)


//Criar texto
pontomenu = CreateText("Ponto")
SetTextSize(pontomenu,60)
SetTextFont(pontomenu,1)
SetTextPosition(pontomenu,410,290)
SetTextColor (pontomenu,200,0,100,0)

pulomenu = CreateText("Pulo")
SetTextSize(pulomenu,60)
SetTextFont(pulomenu,1)
SetTextPosition(pulomenu,410,370)
SetTextColor (pulomenu,200,0,100,0)

mortemenu = CreateText("Morte")
SetTextSize(mortemenu,60)
SetTextFont(mortemenu,1)
SetTextPosition(mortemenu,410,450)
SetTextColor (mortemenu,200,0,100,0)


CreateText(1,"Dr Floppy")
SetTextSize(1,150)
SetTextFont(1,1)
SetTextPosition(1,50,100)
SetTextColor (1,200,0,100,255)



//Botao Play
botao1 =CreateSprite(LoadImage("play-button.png"))
SetSpriteSize(botao1,100,100)
SetSpritePosition(botao1,290,290)


//Botao Config
botao2 =CreateSprite(LoadImage("gear.png"))
SetSpriteSize(botao2,100,100)
SetSpritePosition(botao2,400,290)
return

aux as integer = 0

menuclick:


if GetPointerReleased() // se clicar o mouse
			
	if GetSpriteHitTest(botao1,GetPointerX(),GetPointerY()) //encima do botão play
		PlaySound(click2,25)
		
		
		//Tirar Menu da Tela
		SetSpritePosition(botao1,2000,290)
		SetSpritePosition(botao2,2000,290)
		SetTextPosition(1,5000,1000)
		
		//Tirar visibilidade do menu	
		SetSpriteVisible(botao1,0)
		SetSpriteVisible(botao2,0)
		SetTextVisible(1,0)
		
		if GetTextExists(2) =1
			SetTextVisible(2,0)
		endif
		gosub start
		
	elseif GetSpriteHitTest(botao2,GetPointerX(),GetPointerY())	//encima do botão config
		PlaySound(click1,25)
		
		SetSpritePosition(botao1,2000,290)
		SetSpritePosition(botao2,2000,290)
		
		SetSpriteVisible(botao1,0)
		SetSpriteVisible(botao2,0)
		
		aux =1
		
	endif
			
endif

if aux = 1
	gosub menu2
	aux =aux+1
 endif

if aux = 2
	gosub menu2click
endif


return
