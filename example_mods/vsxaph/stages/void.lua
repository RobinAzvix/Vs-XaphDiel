function onCreate()
	-- background shit
	makeLuaSprite('void', 'void', -600, -300);
	setScrollFactor('void', 0.9, 0.9);

	addLuaSprite('void', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end