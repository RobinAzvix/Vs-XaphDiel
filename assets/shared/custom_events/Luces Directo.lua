function onEvent(eventName, value1, value2)
	if curStage == 'directo' then
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