function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Duo Note' then
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
end
	
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Duo Note' then
		if noteData == 0 then
			characterPlayAnim('gf','singLEFT', true)	
		end
		if noteData == 1 then
			characterPlayAnim('gf','singDOWN', true)
		end
		if noteData == 2 then
			characterPlayAnim('gf','singUP', true)
		end
		if noteData == 3 then
			characterPlayAnim('gf','singRIGHT', true)
		end
	end
end