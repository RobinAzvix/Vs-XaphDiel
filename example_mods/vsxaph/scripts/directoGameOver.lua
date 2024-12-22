local prohibido = {
    'Krakatoa',
    'Ending to the Direct',
    'Lore'
}
local pantallazo = false

for _, noGO in pairs(prohibido) do
    if noGO == songName then
        pantallazo = true
    end
end

function onGameOverStart()
    if pantallazo == false then
        makeLuaSprite('twitch','twitch',0,0)
        setScrollFactor('twitch',0,0)
        addLuaSprite('twitch',true)
        setObjectCamera('twitch','hud')
        setProperty('twitch',0.001)
        setPropertyFromClass('flixel.FlxG','camera.zoom',0.6)
    end
end

function onGameOverConfirm()
    if pantallazo == false then
        doTweenColor('negro', 'twitch', '000000', 2, 'linear')
    end
end