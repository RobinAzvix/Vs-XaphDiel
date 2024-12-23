function onCreate()
	for  i = 0, getProperty('unspawnNotes.length') do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Teamate Note' then
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
		end

		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
	end
end