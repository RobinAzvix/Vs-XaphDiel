package states;

import objects.AttachedSprite;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:FlxColor;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('BGCredits'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		for (mod in Mods.parseList().enabled) pushModCreditsToList(mod);
		#end

		var defaultList:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			["Vs Xaph Team"],
			['Cycled',				'cyc',				"Director, Artista y Animador",						 		 'https://www.youtube.com/@cycledLikeDraws',					'FFFFFF'],
			['SantiAnimations',		'kawaisprite',		"Co-director, Artista y Animador",							 'https://www.youtube.com/@Santi-Animations',					'FFFFFF'],
			['RobinAzvix',			'evilsk8r',			"Co-director, Source & Lua Coder, Charter",					 'https://www.youtube.com/@robinazvix',							'FFFFFF'],
			['Un known Gamer 324',	'theunknowngamer',	"Coder y Animador",							 				 'https://www.youtube.com/@un.knowngamer324',					'FFFFFF'],
			['Winter',				'winter',			"Coder, Artista, Animador y Compositor",					 'https://www.youtube.com/@imwinterpng',						'FFFFFF'],
			['NErxO',				'ninjamuffin99',	"Coder y Charter",						 					 'https://www.youtube.com/@XxNErxOxX',							'FFFFFF'],
			['Juan412',				'phantomarcade',	"Artista",							 						 'https://www.youtube.com/@Juan412gamer',						'FFFFFF'],
			['lucagg',				'evilsk8r',			"Artista",							 						 'https://www.youtube.com/@lucagg5856',							'FFFFFF'],
			['The Xenophanes DX',	'xeno',				"Artista",						 							 'https://twitter.com/Xeno12345rt',								'FFFFFF'],
			['BenKamyn',			'kawaisprite',		"Artista",							 						 'https://www.youtube.com/@Ben-Kamyn',							'FFFFFF'],
			['Nothingness',			'phantomarcade',	"Animador",							 						 'https://www.instagram.com/no____one_____important/',			'FFFFFF'],
			['QuasarXP',			'quazar',			"Animador y Compositor",							 		 'https://www.youtube.com/@QuasarXP_',							'FFFFFF'],
			['Snowlui',				'snow',				"Compositor",						 						 'https://www.youtube.com/@snowlui4458',						'FFFFFF'],
			['Chicharron Prensado',	'chicha',			"Compositor",							 					 'https://x.com/elalexisequisde',								'FFFFFF'],
			['Tonas',				'phantomarcade',	"Compositor",							 					 'https://www.youtube.com/@tonastherealflp',					'FFFFFF'],
			['DudeThatAnimates',	'evilsk8r',			"Compositor",							 					 'https://www.youtube.com/watch?v=fugtxz1znVw',					'FFFFFF'],
			['Jipersickness',		'ninjamuffin99',	"Compositor",						 						 'https://www.youtube.com/@Only_jiper',							'FFFFFF'],
			['Mr. Frostbear',		'phantomarcade',	"Compositor",							 					 'https://www.youtube.com/@El_Frof',							'FFFFFF'],
			['JustSam',				'kawaisprite',		"Chromatic Maker",							 				 'https://x.com/StarSugarySpicy',								'FFFFFF'],
			['S4NT146031',			'ninjamuffin99',	"Voice Actor",						 						 'https://x.com/S4_31X',										'FFFFFF'],
			['Fervoh',				'fervo',			"Charter",							 					 	 'https://twitter.com/Fervo64488176',							'FFFFFF'],
			['Starly',				'kawaisprite',		"Charter",							 					 	 'https://www.youtube.com/watch?v=fugtxz1znVw',					'FFFFFF'],
			[''],
			["Special Thanks"],
			['DaxterXLL',			'dax',				"Apoyo Emocional",							 				 'https://x.com/Daxterxll',										'FFFFFF'],
			['XaphDiel',			'xd',				"No se quien es este pero huele a jabon",					 'https://www.youtube.com/@XaphDiel',							'FFFFFF'],
			['Trecker',				'kawaisprite',		"El inicio de una nueva era",					 			 'https://www.youtube.com/@Treckeruwu',							'FFFFFF'],
			[''],
			['Psych Engine Team'],
			['Shadow Mario',		'shadowmario',		'Main Programmer and Head of Psych Engine',					 'https://ko-fi.com/shadowmario',		'FFFFFF'],
			['Riveren',				'riveren',			'Main Artist/Animator of Psych Engine',						 'https://twitter.com/riverennn',		'FFFFFF'],
			[''],
			['Former Engine Members'],
			['bb-panzu',			'bb',				'Ex-Programmer of Psych Engine',							 'https://twitter.com/bbsub3',			'FFFFFF'],
			['shubs',				'',					'Ex-Programmer of Psych Engine\nI don\'t support them.',	 '',									'FFFFFF'],
			[''],
			['Engine Contributors'],
			['CrowPlexus',			'crowplexus',		'Input System v3, Major Help and Other PRs',				 'https://twitter.com/crowplexus',		'FFFFFF'],
			['Keoiki',				'keoiki',			'Note Splash Animations and Latin Alphabet',				 'https://twitter.com/Keoiki_',			'FFFFFF'],
			['SqirraRNG',			'sqirra',			'Crash Handler and Base code for\nChart Editor\'s Waveform', 'https://twitter.com/gedehari',		'FFFFFF'],
			['EliteMasterEric',		'mastereric',		'Runtime Shaders support',									 'https://twitter.com/EliteMasterEric',	'FFFFFF'],
			['PolybiusProxy',		'proxy',			'.MP4 Video Loader Library (hxCodec)',						 'https://twitter.com/polybiusproxy',	'FFFFFF'],
			['Tahir',				'tahir',			'Implementing & Maintaining SScript and Other PRs',			 'https://twitter.com/tahirk618',		'FFFFFF'],
			['iFlicky',				'flicky',			'Composer of Psync and Tea Time\nMade the Dialogue Sounds',	 'https://twitter.com/flicky_i',		'FFFFFF'],
			['KadeDev',				'kade',				'Fixed some issues on Chart Editor and Other PRs',			 'https://twitter.com/kade0912',		'FFFFFF'],
			['superpowers04',		'superpowers04',	'LUA JIT Fork',												 'https://twitter.com/superpowers04',	'FFFFFF'],
			['CheemsAndFriends',	'face',	'Creator of FlxAnimate\n(Icon will be added later, merry christmas!)',	 'https://twitter.com/CheemsnFriendos',	'FFFFFF'],
			[''],
			["Funkin' Crew"],
			['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",						 'https://twitter.com/ninja_muffin99',	'FFFFFF'],
			['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",							 'https://twitter.com/PhantomArcade3K',	'FFFFFF'],
			['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",							 'https://twitter.com/evilsk8r',		'FFFFFF'],
			['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",							 'https://twitter.com/kawaisprite',		'FFFFFF']
		];
		
		for(i in defaultList) {
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(FlxG.width / 2, 300, creditsStuff[i][0], !isSelectable);
			optionText.isMenuItem = true;
			optionText.targetY = i;
			optionText.changeX = false;
			optionText.snapToPosition();
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Mods.currentModDirectory = creditsStuff[i][5];
				}

				var str:String = 'credits/missing_icon';
				if(creditsStuff[i][1] != null && creditsStuff[i][1].length > 0)
				{
					var fileName = 'credits/' + creditsStuff[i][1];
					if (Paths.fileExists('images/$fileName.png', IMAGE)) str = fileName;
					else if (Paths.fileExists('images/$fileName-pixel.png', IMAGE)) str = fileName + '-pixel';
				}

				var icon:AttachedSprite = new AttachedSprite(str);
				if(str.endsWith('-pixel')) icon.antialiasing = false;
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Mods.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
			else optionText.alignment = CENTERED;
		}

		var up:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('negroarriba'));
		up.antialiasing = ClientPrefs.data.antialiasing;
		up.scrollFactor.set(0,0);
		up.setGraphicSize(Std.int(bg.width * 1));
		up.updateHitbox();
		up.screenCenter();
		add(up);

		var down:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('negroabajo'));
		down.antialiasing = ClientPrefs.data.antialiasing;
		down.scrollFactor.set(0,0);
		down.setGraphicSize(Std.int(bg.width * 1));
		down.updateHitbox();
		down.screenCenter();
		add(down);
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(shiftMult);
					holdTime = 0;
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT && (creditsStuff[curSelected][3] == null || creditsStuff[curSelected][3].length > 4)) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.bold)
			{
				var lerpVal:Float = Math.exp(-elapsed * 12);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(item.x - 70, lastX, lerpVal);
				}
				else
				{
					item.x = FlxMath.lerp(200 + -40 * Math.abs(item.targetY), item.x, lerpVal);
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:FlxColor = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		//trace('The BG color is: $newColor');
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	#if MODS_ALLOWED
	function pushModCreditsToList(folder:String)
	{
		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
	}
	#end

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}
