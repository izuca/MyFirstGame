#include "menusons.agc"
menu2:
SetSpriteColorAlpha(1,0)

//Sprites
imagens = CreateText("Sprites")
SetTextSize(imagens,50)
SetTextFont(imagens,1)
SetTextPosition(imagens,50,300)
SetTextColor (imagens,200,0,100,255)


//Sons
Sons = CreateText("Sons")
SetTextSize(Sons,50)
SetTextFont(Sons,1)
SetTextPosition(Sons,50,375)
SetTextColor (Sons,200,0,100,255)

//Musica
Musica = CreateText("Musica")
SetTextSize(Musica,50)
SetTextFont(Musica,1)
SetTextPosition(Musica,50,450)
SetTextColor (Musica,200,0,100,255)


return


menu2click:
if GetPointerReleased() // se clicar o mouse
	
	if GetTextHitTest(imagens,GetPointerX(),GetPointerY()) //encima do botão play
		PlaySound(click1,25)
					
		//Deixar os botoes inalcansáveis
		SetTextPosition(imagens,2000,290)
		SetTextPosition(Sons,2000,290)
		SetTextPosition(Musica,2000,290)
		
		gosub menuSprite
				
	elseif GetTextHitTest(Sons,GetPointerX(),GetPointerY())	//encima do botão config
		PlaySound(click1,25)
			
		//Deixar os botoes inalcansáveis
		SetTextPosition(imagens,2000,290)
		SetTextPosition(Sons,2000,290)
		SetTextPosition(Musica,2000,290)
			
		auxiliar =1		
		
		
			
	elseif GetTextHitTest(Musica,GetPointerX(),GetPointerY())	//encima do botão config
		PlaySound(click1,25)
		
		//Deixar os botoes inalcansáveis
		SetTextPosition(imagens,2000,290)
		SetTextPosition(Sons,2000,290)
		SetTextPosition(Musica,2000,290)
		
		auxiliar = 2
				
		
	endif
endif


return
