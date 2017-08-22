local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,-20);
	OnCommand=cmd(addx,-SCREEN_WIDTH*2.5;sleep,0.5;smooth,0.3;addx,SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;zoomx,5;diffusealpha,0);
	-- Information panel
	Def.Sprite{
		InitCommand=cmd(addy,-46;addx,76);
		OnCommand=cmd(addy,10);
		GainFocusCommand=function(s) s:stoptweening():linear(0.2):addy(-10):addx(10):zoom(1):Load(THEME:GetPathG("ScreenSelectGameMode","Scroll Choice2MIX/char.png")) end;
		LoseFocusCommand=function(s) s:stoptweening():linear(0.2):addy(10):addx(-10):zoom(0.75):Load(THEME:GetPathG("ScreenSelectGameMode","Scroll Choice2MIX/char dark.png")) end;
	};
	Def.ActorFrame{
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,true);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,false);
		LoadActor(THEME:GetPathG("","_sharedX3/GameMode/base"))..{
			InitCommand=cmd(addy,184;addx,20;diffusealpha,1);
		};
		LoadActor("text.png")..{
			InitCommand=cmd(addy,186;addx,62;);
		};
		LoadActor("text glow.png")..{
			InitCommand=cmd(blend,Blend.Add;;diffuse,color("1,1,1,0.5");addy,186;addx,62;zoom,1.01;);
			OnCommand=cmd(queuecommand,"Anim");
			GainFocusCommand=cmd(finishtweening;queuecommand,"Anim");
			LoseFocusCommand=cmd(finishtweening;stopeffect);
			AnimCommand=cmd(fadeleft,0;faderight,2;diffusealpha,0;sleep,1;linear,0.2;diffusealpha,1;linear,0.4;faderight,0;fadeleft,2;linear,0.1;diffusealpha,0;sleep,1.2;queuecommand,"Anim");
		};
	};
	Def.ActorFrame{
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,false);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,true);
		LoadActor("unfocused base")..{
			InitCommand=cmd(addy,184;addx,20;);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(addx,-195;addy,126);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
		Def.Sprite{
			Texture = "icon 1x2";
			InitCommand=cmd(setstate,1;pause;);
			GainFocusCommand=function(s) s:setstate(0); end;
			LoseFocusCommand=function(s) s:setstate(1); end;
		};
		Def.Sprite{
			Texture = "icon 1x2";
			InitCommand=cmd(setstate,0;pause;blend,Blend.Add;diffusealpha,0);
			GainFocusCommand=cmd(finishtweening;queuecommand,"Anim");
			AnimCommand=cmd(rotationz,0;zoom,1;sleep,0.8;diffusealpha,0.5;linear,0.2;rotationz,360;linear,0.2;zoom,1.1;linear,0.2;diffusealpha,0;sleep,1.4;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
	};
	Def.Sprite{
		Texture = "icon 1x2";
		InitCommand=cmd(setstate,1;pause;addx,-146;addy,90;visible,true);
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,false);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,true);
	};
};

return t;
