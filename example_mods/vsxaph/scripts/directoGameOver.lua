function onGameOverStart()
    if songName == 'Directo' then
        makeLuaSprite('twitch','twitch',-640,-360)
        scaleObject('twitch', 2, 2)
        setScrollFactor('twitch',0,0)
        addLuaSprite('twitch',true)
        setProperty('twitch',0.001)
        runTimer('Error',2)
        setPropertyFromClass('flixel.FlxG','camera.zoom',1)
    end
end

function onTimerCompleted(tag)
    if tag == 'Error' then
        doTweenAlpha('twitchAlpha','twitch',1,4)
    end
end