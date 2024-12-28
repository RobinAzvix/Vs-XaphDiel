function onCreate()
	makeLuaSprite('wall','stages/xaph/stageback',-790,-200)
	scaleObject('wall', 0.9, 0.9);
	addLuaSprite('wall',false)

	makeLuaSprite('floor','stages/xaph/stagefront',-640,550)
	scaleObject('floor', 0.81, 0.81);
	addLuaSprite('floor',false)

	makeLuaSprite('bg','',-790,-200)
	makeGraphic('bg','2280','1210','000000')
	setProperty('bg.alpha', 0)
	addLuaSprite('bg',false)

	makeLuaSprite('luz','stages/xaph/spotlight',110,-60)
	scaleObject('luz', 0.8, 0.8);
	setBlendMode('luz','add')
	setProperty('luz.alpha', 0)
	addLuaSprite('luz',true)

	makeLuaSprite('cortinas','stages/xaph/stagecurtains',-640,-180)
	scaleObject('cortinas', 0.82, 0.82);
	addLuaSprite('cortinas',true)

	if not downscroll then
		makeLuaSprite('bflife','',204,527)
		makeGraphic('bflife',608,24,'000000')
		addLuaSprite('bflife', true);
		setObjectCamera('bflife','hud')

		makeLuaSprite('bflife2','',208,533)
		makeGraphic('bflife2',600,12,'63BAFF')
		addLuaSprite('bflife2', true);
		setObjectCamera('bflife2','hud')

		makeLuaSprite('nlife2','',208,533)
		makeGraphic('nlife2',1,12,'FF00B3')
		addLuaSprite('nlife2', true);
		setObjectCamera('nlife2','hud')
	else
		makeLuaSprite('bflife','',204,119)
		makeGraphic('bflife',608,20,'000000')
		addLuaSprite('bflife', true);
		setObjectCamera('bflife','hud')

		makeLuaSprite('bflife2','',208,123)
		makeGraphic('bflife2',600,12,'63BAFF')
		addLuaSprite('bflife2', true);
		setObjectCamera('bflife2','hud')

		makeLuaSprite('nlife2','',208,123)
		makeGraphic('nlife2',1,12,'FF00B3')
		addLuaSprite('nlife2', true);
		setObjectCamera('nlife2','hud')
	end

	makeLuaSprite('stream', 'stages/trecker/back', 0, 0);
	scaleObject('stream', 1.3, 1.3);
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
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)

	setObjectOrder('dadGroup', getObjectOrder('stream') + 1 );
	setObjectCamera('dadGroup','other')
	scaleObject('dadGroup', getProperty('defaultCamZoom'), getProperty('defaultCamZoom'))

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
		setProperty('iconP1.y',50)
		setProperty('iconP2.y',50)
	else
		setProperty('iconP1.y',450)
		setProperty('iconP2.y',450)
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
		noteTweenX(defaultPlayerStrumX0, 4, 305,0.3,'linear');
		noteTweenX(defaultPlayerStrumX1, 5, 402.5,0.3,'linear');
		noteTweenX(defaultPlayerStrumX2, 6, 499.5,0.3,'linear');
		noteTweenX(defaultPlayerStrumX3, 7, 600,0.3,'linear');

        if not downscroll then
            for i = 0,7 do
                setPropertyFromGroup('strumLineNotes', i, 'y', 60);
            end
        else
            for i = 0,7 do
                setPropertyFromGroup('strumLineNotes', i, 'y', 470);
            end
        end
	end
end