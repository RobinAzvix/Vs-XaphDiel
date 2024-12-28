function onCreate()
	makeLuaSprite('cuarto','stages/xaph/cuartofeo',1270,500)
	scaleObject('cuarto', 1.5, 1.5);
	addLuaSprite('cuarto',false)

	makeLuaSprite('wall','stages/xaph/stageback',-790,-200)
	scaleObject('wall', 0.8, 0.8);
	addLuaSprite('wall',false)

	makeLuaSprite('floor','stages/xaph/stagefront',-640,600)
	scaleObject('floor', 0.75, 0.8);
	addLuaSprite('floor',false)

	makeLuaSprite('bg','',-790,-200)
	makeGraphic('bg','2080','1210','000000')
	setProperty('bg.alpha', 0)
	addLuaSprite('bg',false)

	makeLuaSprite('luz','stages/xaph/spotlight',110,0)
	scaleObject('luz', 0.8, 0.8);
	setBlendMode('luz','add')
	setProperty('luz.alpha', 0)
	addLuaSprite('luz',true)

	makeLuaSprite('cortinas','stages/xaph/stagecurtains',-640,-100)
	scaleObject('cortinas', 0.75, 0.8);
	addLuaSprite('cortinas',true)

	if not downscroll then
		makeLuaSprite('bflife','',204,567)
		makeGraphic('bflife',608,24,'000000')
		addLuaSprite('bflife', true);
		setObjectCamera('bflife','hud')

		makeLuaSprite('bflife2','',208,573)
		makeGraphic('bflife2',600,12,'63BAFF')
		addLuaSprite('bflife2', true);
		setObjectCamera('bflife2','hud')

		makeLuaSprite('nlife2','',208,573)
		makeGraphic('nlife2',1,12,'0055FF')
		addLuaSprite('nlife2', true);
		setObjectCamera('nlife2','hud')
	else
		makeLuaSprite('bflife','',204,149)
		makeGraphic('bflife',608,20,'000000')
		addLuaSprite('bflife', true);
		setObjectCamera('bflife','hud')

		makeLuaSprite('bflife2','',208,153)
		makeGraphic('bflife2',600,12,'63BAFF')
		addLuaSprite('bflife2', true);
		setObjectCamera('bflife2','hud')

		makeLuaSprite('nlife2','',208,153)
		makeGraphic('nlife2',1,12,'0055FF')
		addLuaSprite('nlife2', true);
		setObjectCamera('nlife2','hud')
	end

	makeLuaSprite('stream', 'stages/xaph/Overlay', 0, 0);
	scaleObject('stream', 0.95, 0.95);
	setObjectCamera('stream','other')
	addLuaSprite('stream', false);

	makeLuaText('ST', 'Score: ' .. math.floor(score) .. ' || Misses: ' .. math.floor(misses) .. ' || Accurracy: ' .. math.floor(rating*100) .. '%', 1800, -400, 670)
    addLuaText('ST',true)
    setTextSize('ST', 21);
    setObjectCamera('ST', 'other')
end

function onCreatePost()
	setProperty('healthBar.visible',false)
	setProperty('healthBarBG.visible',false)
	setProperty('gf.visible',false)
	setProperty('scoreTxt.visible', false)
	setProperty('botplayTxt.visible', false)

	setObjectOrder('dadGroup', getObjectOrder('cuarto') + 1 );

	triggerEvent('Camera Follow Pos', 600, 480)
end

function onUpdate(elapsed)
	scaleObject('nlife2', math.floor(getProperty("health") * 300) - 600, 1)

	setProperty('botplayTxt.visible', false)
	
	if not botPlay then
		setTextString('ST',  'Score: ' .. math.floor(score) .. ' || Misses: ' .. math.floor(misses) .. ' || Accurracy: ' .. math.floor(rating*100) .. '%')
	else
		setTextString('ST',  'BOTPLAY')
	end
end

function onUpdatePost()

	setProperty('iconP1.x', 825)
	setProperty('iconP2.x', 50)

	if downscroll then
		setProperty('iconP1.y',90)
		setProperty('iconP2.y',90)
	else
		setProperty('iconP1.y',490)
		setProperty('iconP2.y',490)
	end

    if curStep > -1 then
        -- Scale Player Notes
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.6);
            setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.6);
        end

		for i = 0, getProperty('unspawnNotes.length')-1 do
            setPropertyFromGroup('unspawnNotes', i, 'scale.x', 0.6);
            setPropertyFromGroup('unspawnNotes', i, 'scale.y', 0.6);
        end

        -- Move notes to the middle
		noteTweenX(defaultOpponentStrumX0, 0, 3000,0.3,'linear');
		noteTweenX(defaultOpponentStrumX1, 1, 3650,0.3,'linear');
		noteTweenX(defaultOpponentStrumX2, 2, 4300,0.3,'linear');
		noteTweenX(defaultOpponentStrumX3, 3, 4950,0.3,'linear');
		noteTweenX(defaultPlayerStrumX0, 4, 300,0.3,'linear');
		noteTweenX(defaultPlayerStrumX1, 5, 397.5,0.3,'linear');
		noteTweenX(defaultPlayerStrumX2, 6, 494.5,0.3,'linear');
		noteTweenX(defaultPlayerStrumX3, 7, 595,0.3,'linear');

        if not downscroll then
            for i = 0,7 do
                setPropertyFromGroup('strumLineNotes', i, 'y', 120);
            end
        else
            for i = 0,7 do
                setPropertyFromGroup('strumLineNotes', i, 'y', 505);
            end
        end
	end
end