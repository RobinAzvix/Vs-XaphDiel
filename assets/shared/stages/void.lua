function onCreate()
	makeAnimatedLuaSprite('waton','stages/sans/cuadro',	-600,	-300)
	addAnimationByPrefix('waton','webeando','cuadro idle',18,true)
	scaleObject('waton', 3, 3)
	addLuaSprite('waton',false)
end

function onCreatePost()
	setProperty('gf.visible',false)
end