function onCreate()
	makeLuaSprite('bg','',-1000,-50)
	makeGraphic('bg',620,620,'FFFFFF')
	addLuaSprite('bg',false)

	makeLuaSprite('house', 'stages/bad/cuarto', -1500, -200);
	scaleObject('house', 2.75, 2.75)
	addLuaSprite('house', false);
end

function onCreatePost()
	setProperty('gf.visible',false)
end