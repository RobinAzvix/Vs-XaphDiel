function onCreate()
	makeLuaSprite('gartic', 'stages/xaphinette/gartic', 100, 0);
	scaleObject('gartic', 1.05, 1.05)
	setObjectCamera('gartic','other')
	addLuaSprite('gartic', false);

	makeLuaSprite('bg','',-1500,-550)
	makeGraphic('bg',2500,1500,'FFFFFF')
	addLuaSprite('bg',false)

	makeLuaSprite('end','',840,649)
	makeGraphic('end',200,51,'FF0000')
	setProperty('end.alpha', 0)
	setObjectCamera('end','other')
	addLuaSprite('end',false)

	makeLuaSprite('phone', 'stages/xaphinette/phone', -765, 0);
	scaleObject('phone', 1, 1)
	setProperty('phone.alpha', 0.2)
	addLuaSprite('phone', false);

	setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
end

function onCreatePost()
	setProperty('healthBar.visible',false)
	setProperty('healthBarBG.visible',false)
	setProperty('gf.visible',false)
    setProperty('iconP1.visible',false)
	setProperty('iconP2.visible',false)
    setProperty('scoreTxt.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeBarBG.visible', false)
	setProperty('showRating', false);
	setProperty('showComboNum', false);

	triggerEvent('Camera Follow Pos', -260, 200)

	makeLuaText("nametext", 'GARTIC',0,580,110)
	setObjectCamera("nametext",'other')
	setTextSize('nametext',  40)
	setTextFont('nametext', 'gartic.otf')
	setTextBorder('nametext', 1, '0044AA')
	setTextColor('nametext', '00AAFF')
	setTextAlignment('nametext', 'center')
	addLuaText("nametext")
end
function onUpdatePost()

    if curStep > -1 then
        -- Scale Player Notes
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.4);
            setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.4);
        end

		for i = 0, getProperty('unspawnNotes.length')-1 do
            setPropertyFromGroup('unspawnNotes', i, 'scale.x', 0.4);
            setPropertyFromGroup('unspawnNotes', i, 'scale.y', 0.4);
        end

        -- Move notes to the middle
		if not middlescroll then
			noteTweenX(defaultOpponentStrumX0, 0, 300,0.3,'linear');
			noteTweenX(defaultOpponentStrumX1, 1, 365,0.3,'linear');
			noteTweenX(defaultOpponentStrumX2, 2, 430,0.3,'linear');
			noteTweenX(defaultOpponentStrumX3, 3, 495,0.3,'linear');
			noteTweenX(defaultPlayerStrumX0, 4, 680,0.3,'linear');
			noteTweenX(defaultPlayerStrumX1, 5, 745,0.3,'linear');
			noteTweenX(defaultPlayerStrumX2, 6, 810,0.3,'linear');
			noteTweenX(defaultPlayerStrumX3, 7, 875,0.3,'linear');

		else
			noteTweenX(defaultOpponentStrumX0, 0, -260,0.3,'linear');
			noteTweenX(defaultOpponentStrumX1, 1, -340,0.3,'linear');
			noteTweenX(defaultOpponentStrumX2, 2, -420,0.3,'linear');
			noteTweenX(defaultOpponentStrumX3, 3, -500,0.3,'linear');
			noteTweenX(defaultPlayerStrumX0, 4, 480,0.3,'linear');
			noteTweenX(defaultPlayerStrumX1, 5, 547.5,0.3,'linear');
			noteTweenX(defaultPlayerStrumX2, 6, 612.5,0.3,'linear');
			noteTweenX(defaultPlayerStrumX3, 7, 680,0.3,'linear');
		end

        if not downscroll then
            for i = 0,7 do
                setPropertyFromGroup('strumLineNotes', i, 'y', 160);
            end
        else
            for i = 0,7 do
                setPropertyFromGroup('strumLineNotes', i, 'y', 505);
            end
        end
	end

	if mouseOverlaps('end') and mouseClicked('left') then
		endSong()
    end
end

function mouseOverlaps(tag)
    addHaxeLibrary('Reflect')
    return runHaxeCode([[
        var obj = game.getLuaObject(']]..tag..[[');
        if (obj == null) obj = Reflect.getProperty(game, ']]..tag..[[');
        if (obj == null) return false;
        return obj.getScreenBounds(null, obj.cameras[0]).containsPoint(FlxG.mouse.getScreenPosition(obj.cameras[0]));
    ]])
end

function onUpdate(elapsed)
	if timeBarType ~= 'Song Name' then
		setTextString('nametext', getProperty('timeTxt.text'))
		setProperty('nametext.x', 610)
	end
end