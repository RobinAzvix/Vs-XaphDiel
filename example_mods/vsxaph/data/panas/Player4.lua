--WTF Recicle un script que habia hecho para otro mod :O
function onCreate()
    makeAnimatedLuaSprite('Player4', 'characters/Pico_FNF_assetss', 300, 375) -- (Tag [NOT CHANGE], characters/NAME-OF-CHARACTER [png and XML], position x, position y)
    setObjectOrder('Player4', getObjectOrder('gfGroup') + 1) -- In front of gf (Posibly not necessary)
    setProperty('Player4.flipX', true)

    --Main Animations (Sing + Idle)
    addAnimationByPrefix('Player4', 'idle', 'Pico Idle Dance', 24, false) -- Idle
    addAnimationByPrefix('Player4', 'singLEFT', 'Pico Note Right0', 24, false) -- Sing Left
    addAnimationByPrefix('Player4', 'singDOWN', 'Pico Down Note0', 24, false) -- Sing Down
    addAnimationByPrefix('Player4', 'singUP', 'pico Up note0', 24, false) -- Sing Up
    addAnimationByPrefix('Player4', 'singRIGHT', 'Pico NOTE LEFT0', 24, false) -- Sing Right

    -- If You Want to add more animations: addAnimationByPrefix(Tag [NOT CHANGE], json animation name, XML animation name,framerate,bool [T/F])


    --Main Offsets (You can find them on character json)
    addOffset('Player4', 'idle', 0, 0)
    addOffset('Player4', 'singLEFT', 65, 9)
    addOffset('Player4', 'singDOWN', 200, -77)
    addOffset('Player4', 'singUP', -29, 27)
    addOffset('Player4', 'singRIGHT', -68, 7)

    --If you want to add offsets: addOffset(Tag,json animation name,position x, position y)
    
    addLuaSprite('Player4', false) -- for Add character in gameplay DO NOT TOUCH!!!!!!

end

-- Play animations when touch a note
function opponentNoteHit(id, direction, noteType, isSustainNote) 
    if noteType == 'Teamate Note' or noteType == 'Duo Note' then --Detects Teamate/Duo Notes

    if direction == 0 then -- Sing Left
        playAnim('Player4', 'singLEFT', true)
        runTimer('idlekeys',0.35)-- Sing Duration
    end
    if direction == 1 then -- Sing Down
        playAnim('Player4', 'singDOWN', true)
        runTimer('idlekeys',0.35)-- Sing Duration
    end
    if direction == 2 then -- Sing Up
        playAnim('Player4', 'singUP', true)
        runTimer('idlekeys',0.35)-- Sing Duration
    end
    if direction == 3 then -- Sing Right
        playAnim('Player4', 'singRIGHT', true)
        runTimer('idlekeys',0.35)-- Sing Duration
    end
end
end
function onCountdownTick(counter) -- synchronize with the opponent's idle
    if counter == 2 and getProperty("dad.animation.curAnim.name") == 'idle' then
    playAnim('Player4', 'idle', false)
    end
    if counter == 0 and getProperty("dad.animation.curAnim.name") == 'idle' then
    playAnim('Player4', 'idle', false)
    end
end
function onSongStart()
    playAnim('Player4', 'idle', false)
end
function onBeatHit()
    if curBeat %2 == 0 then
            playAnim('Player4', 'idle', false)
        end
    end
function onTimerCompleted(tag)
    if tag == 'idle' then
            playAnim('Player4', 'idle', false)
		end
	if tag == 'idlekeys' then
		if keyPressed("left") or keyPressed("down") or keyPressed("up") or keyPressed("right") then
            runTimer('idlekeys',0.001,1)
		else
            playAnim('Player4', 'idle', false)
		end
	end
end