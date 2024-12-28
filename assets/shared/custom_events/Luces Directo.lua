local escenarios = {
    'directo',
    'teke'
}
local pantallazo = false

for _, noGO in pairs(escenarios) do
    if noGO == curStage then
        pantallazo = true
    end
end

function onEvent(eventName, value1, value2)
	if pantallazo == true then
		if eventName == 'Luces Directo' then
			if value1 == '1' then
				doTweenAlpha('negro', 'bg', 0.25, value2)
				doTweenAlpha('blanco', 'luz', 0.375, value2)
				doTweenColor('cnegras', 'cortinas', 'DDDDDD', value2, 'linear')
			elseif value1 == '0' then
				doTweenAlpha('negront', 'bg', 0, value2)
				doTweenAlpha('blancont', 'luz', 0, value2)
				doTweenColor('cblancas', 'cortinas', 'FFFFFF', value2, 'linear')
			end
		end
	end
	
end