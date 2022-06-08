analise:
#include "Passaro.agc"
#include "Base.agc"
#include "menu.agc"
#include "menu2.agc"
#include "menusprites.agc"
#include "Cano.agc"
#include "bgdomenu.agc"
#include "points.agc"
#include "menusons.agc"
#include "menumusica.agc"
#include "gameplay.agc"

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Dr.Floppy" )
SetWindowSize( 600, 800, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 600, 800 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts


//Criar o background
plano = CreateSprite(LoadImage("BackgroundOficial.png")) //Sprite do Plano de Fundo
SetSpriteSize(plano,600,800)


//Pontuação
pointmax = 0
points= 0
pointcon = 1

//Rodar outros arquivos
gosub Criar_Base
gosub passarinho
gosub Menu
gosub canosprite
gosub bgsprite
gosub ponto

SetSpriteDepth(plano,GetSpriteDepth(base)+10)
auxiliar as integer = 0

//Musica do Menu
musicam = LoadMusic ("Musica1.mp3")
PlayMusic(musicam,1)
SetMusicFileVolume(musicam,15)

//Sons
click2 = LoadSound("clique2.wav")
click1 = LoadSound("clique1.wav")
voandosfx = LoadSound("voando.wav")
pontosfx = LoadSound("Ponto.wav")
mortesfx = LoadSound("deathsound.wav")
musica2 = LoadMusic("Musica2.mp3")
musica3 = LoadMusic("Musica3.mp3")

//Texto de Game Over
CreateText(2,"Game Over")
SetTextVisible(2,0)

//Carregar mouse
mouse = CreateSprite(LoadImage("mouse.png"))
SetSpriteSize(mouse,48,48)
SetSpritePosition(mouse,245,450)
SetSpriteColorAlpha(mouse,255)

//Tutorial
tutorial = CreateText("Aperte")
tutorial2 = CreateText("para pular")

SetTextFont(tutorial,1)
SetTextFont(tutorial2,1)

SetTextPosition(tutorial,120,450)
SetTextPosition(tutorial2,300,450)

SetTextSize(tutorial,50)
SetTextSize(tutorial2,50)

SetTextColor (tutorial,200,0,100,255)
SetTextColor (tutorial2,200,0,100,255)

gap as integer = 600 // Espaço entre canos

//Criação dos canos de baixo
for i = 1 to 5
	CreateSprite(i+5,LoadImage("Cano.png"))
	SetSpriteSize(i+5,75,390)
	
	if i = 1
		SetSpritePosition(i+5,Random(gap,2000),random(300,500))
	else
		SetSpritePosition(i+5,GetSpriteX((i+5)-1)+ 225,random(300,500))
	endif
	
	SetSpriteDepth(i+5,GetSpriteDepth(base)+1)
	gap = gap + i*100
	SetSpriteVisible(i+5,0)
	
next i

gap= 600
//Criação dos canos de cima
for j = 1 to 5
	CreateSprite(j+10,LoadImage("Cano.png"))
	SetSpriteSize(j+10,75,390)
	SetSpriteAngle(j+10,180)
	
	SetSpritePosition(j+10,GetSpriteX(j+5),GetSpriteY(j+5) - 556)
	
	gap = gap + j*100
	SetSpriteVisible(j+10,0)
next j

alpha = 0
//Main Loop
do
    gosub Mover_Base //base movendo eternamente
	if auxiliar = 0
		gosub menuclick
	elseif auxiliar = 1
		gosub menusons
	elseif auxiliar = 2
		gosub menumusica
	endif
	
	//Se o jogo começar
	if GetVirtualButtonExists(1) = 1
	
	//Tutorial
	SetSpriteVisible(mouse,0)
	SetTextVisible(tutorial,0)
	SetTextVisible(tutorial2,0)
	//som
	if points = 25
		PlayMusic(musica2,1)
	endif
	
	if points = 50
		PlayMusic(musica3,1)
	endif
	
	//Pontuação
	Print("  ")
	PrintC("              ")
	Print(points)
	
	SetTextVisible(score,0)
	SetTextVisible(highscore,0)
	
	//Reposicionamento dos Canos
	for i = 1 to 5 
		CanoX = GetSpriteX(i+5)-2
		
		If CanoX < 525
			SetSpriteVisible(i+5,1)
			SetSpriteVisible(i+10,1)
		else
			SetSpriteVisible(i+5,0)
			SetSpriteVisible(i+10,0)
		endif
		
		If CanoX < 0
			CanoX = 825//GetSpriteX(11-i) + 225
		endif
		
		SetSpritePosition(i+5,CanoX,GetSpriteY(i+5))
		SetSpritePosition(i+10,CanoX,GetSpriteY(i+10))
	next i
			
			SetSpritePhysicsAngularImpulse( 1, 100 ) //Passaro Girando Pra cair
			
			//Passaro Pulando
			if GetSpriteVisible(botao1) = 0
				if GetVirtualButtonPressed(1) = 1
					
					//Som
					PlaySound(voandosfx,10) //Efeito do Pulo
					
					
					SetSpritePhysicsImpulse( 1, 0,0, 0, -15000) //Impulso pra cima
					SetSpritePhysicsAngularImpulse(1,0)
					SetSpriteAngle(1,GetSpriteAngle(1) - (GetSpriteAngle(1) + 50)) // Ajuste da rotação
				endif
			endif
			
			//Pontuação
			
			for i = 1 to 5
				if pointcon = i	
					if GetSpriteX(1) > GetSpriteX(i+5)+75
							points= points + 1
							pointcon = pointcon + 1
							PlaySound(pontosfx,20)
							
					endif
				endif	
			next i
			
			if pointcon = 5
				pointcon = 1
			endif
			
			
			
			//Game Over	
			if GetSpriteCollision(1,base) = 1 or GetSpriteCollision(1,6) or GetSpriteCollision(1,7) or GetSpriteCollision(1,8) or GetSpriteCollision(1,9) or GetSpriteCollision(1,10) or GetSpriteCollision(1,11) or GetSpriteCollision(1,12) or GetSpriteCollision(1,13) or GetSpriteCollision(1,14) or GetSpriteCollision(1,15) //Se o pássaro bater na base
				
				DeleteVirtualButton(1)
				PlaySound(mortesfx,50)
				StopMusic()
				
				
				
				//Reposicionar Sprite do Pássaro
				SetSpritePosition(1,100,345)
				SetSpritePhysicsOff(1)
				SetSpriteAngle(1,GetSpriteAngle(1)-GetSpriteAngle(1))
				SetSpriteSize(1,102,72)
				
				//Menu do Game Over
				SetTextVisible(2,1)
				SetTextSize(2,125)
				SetTextFont(2,1)
				SetTextPosition(2,50,150)
				SetTextColor (2,200,0,100,255)
				
				//Reposicionar Pontuação
				
				
				
				//Reposicionar os canos e deixá-los invisíveis
				for i = 1 to 5
					if i = 1
						SetSpritePosition(i+5,Random(gap,2000),random(300,500))
						
					else
						SetSpritePosition(i+5,GetSpriteX((i+5)-1)+ 225,random(300,500))
						
					endif
					SetSpritePosition(i+10,GetSpriteX(i+5),GetSpriteY(i+5) - 556)
					
					SetSpriteVisible(i+5,0) //Canos baixo invisiveis
					SetSpriteVisible(i+10,0) //Canos cimas invisiveis
				next i
				
				//Voltar com o menu
				SetSpritePosition(botao1,265,50)
				SetSpriteSize(botao1,50,50)
				SetSpriteVisible(botao1,1)
				
				gosub menuclick
				
				
			endif	
			
			
	endif 
				
	if GetMusicPlaying() = 0
			if points > pointmax
				pointmax = points
			endif
		
		//Pontuação
			Print("  ")
			Print("  ")
			Print("  ")
			Print("  ")
			Print("  ")
			Print("  ")
			PrintC("                         ")
			Print(pointmax)
			Print("  ")
			PrintC("                       ")
			Print(points)
			
			SetTextVisible(score,1)
			SetTextVisible(highscore,1)
    endif
    
    Sync()
loop

