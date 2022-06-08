Criar_Base:
SetDefaultWrapU(1) // impede que a sprite estique
base = CreateSprite(LoadImage("BaseOficial.png"))
SetSpriteSize(base,600,200)
SetSpritePosition(base,0,650)

//Sprite pro menu
basepng = CreateSprite(LoadImage("BaseOficial.png"))
SetSpriteSize(basepng,200,70)
SetSpriteColorAlpha(basepng,0)
SetSpritePhysicsOn(base,1) //Ativa Física da Base
SetSpriteShape(base,2)
return

Mover_Base:


xscroll# = xscroll# + .01
SetSpriteUVOffset(base,xscroll#,0) //duplica a imagem
	
return
	

	
