function onCreate()
	-- background shit
	makeLuaSprite('stream', 'stream', -600, -300);
	setScrollFactor('stream', 1.0, 1.0);
	scaleObject('stream', 1.9, 1.9);

	addLuaSprite('stream', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end