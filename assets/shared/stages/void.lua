function onCreate()
	makeAnimatedLuaSprite('waton','stages/sans/cuadro',	-600,	-300)
	addAnimationByPrefix('waton','webeando','cuadro idle',18,true)
	scaleObject('waton', 3, 3)
	addLuaSprite('waton',false)

	makeLuaText('ST', 'HP', 40, 500, 60)
	setTextColor('ST', 'FFFFFF')
    addLuaText('ST',true)
	setTextFont('ST', 'undertale.otf')
    setTextSize('ST', 30);
    setObjectCamera('ST', 'hud')

	makeLuaText('ST2', math.floor(getProperty("health") * 10) .. '/20', 100, 670, 60)
	setTextColor('ST2', 'FFFFFF')
    addLuaText('ST2',true)
	setTextFont('ST2', 'undertale.otf')
    setTextSize('ST2', 30);
    setObjectCamera('ST2', 'hud')

	if not downscroll then
		makeLuaSprite('bflife','',560,620)
		makeGraphic('bflife',100,40,'AA0000')
		addLuaSprite('bflife', true);
		setObjectCamera('bflife','hud')

		makeLuaSprite('bflife2','',560,620)
		makeGraphic('bflife2',1,40,'FFFF00')
		addLuaSprite('bflife2', true);
		setObjectCamera('bflife2','hud')

		setProperty('ST.y', 620)
		setProperty('ST2.y', 620)
	else
		makeLuaSprite('bflife','',560,60)
		makeGraphic('bflife',100,40,'AA0000')
		addLuaSprite('bflife', true)
		setObjectCamera('bflife','hud')

		makeLuaSprite('bflife2','',560,60)
		makeGraphic('bflife2',1,40,'FFFF00')
		addLuaSprite('bflife2', true);
		setObjectCamera('bflife2','hud')
	end
end

function onCreatePost()
	setProperty('healthBar.visible',false)
	setProperty('healthBarBG.visible',false)
	setTextFont('scoreTxt', 'undertale.otf')
	setTextFont('botplayTxt', 'undertale.otf')
	setTextFont('timeTxt', 'undertale.otf')
	setProperty('iconP1.visible',false)
	setProperty('iconP2.visible',false)
	setProperty('gf.visible',false)
end

function onUpdate(elapsed)
	setTextString('ST2', math.floor(getProperty("health") * 10) .. '/20')
	scaleObject('bflife2', math.floor(getProperty("health") * 50), 1)
end