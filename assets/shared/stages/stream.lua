function onCreate()
	makeLuaSprite('stream', 'stream', -600, -300);
	setScrollFactor('stream', 1.0, 1.0);
	scaleObject('stream', 1.9, 1.9);

	addLuaSprite('stream', false);
end

function onCreatePost()
	if songName == 'Meme' then
		makeAnimatedLuaSprite('waton','stages/meme/waton',	0,	160)
		addAnimationByPrefix('waton','webeando','waton webeando',13,true)
		scaleObject('waton', 3, 3)
		addLuaSprite('waton',false)

		setProperty('boyfriend.visible', false)
		setProperty('dad.visible', false)
		setProperty('iconP2.visible', false)
		setHealthBarColors('FF0000', '00FF00')
	end
end