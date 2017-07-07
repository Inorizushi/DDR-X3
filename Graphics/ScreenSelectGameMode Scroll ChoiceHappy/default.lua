local t = Def.ActorFrame{
	InitCommand=cmd(x,-20);
	OnCommand=cmd(addx,SCREEN_WIDTH*2.5;sleep,0.5;smooth,0.3;addx,-SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.1;zoomy,0;diffusealpha,0);

	-- Information panel
	LoadActor("Happy icon")..{
		GainFocusCommand=function(s) s:linear(0.2):zoom(1):diffuse(color("1,1,1,1")); end;
		LoseFocusCommand=function(s) s:stoptweening():linear(0.2):zoom(0.75):diffuse(color("0.6,0.6,0.6,1")); end;
		OffCommand=cmd(sleep,0.116;linear,0.1;zoomy,0;diffusealpha,0);
	};
	--[[LoadActor("char")..{
		InitCommand=cmd(addy,-36;addx,14);
	};
	LoadActor(THEME:GetPathG("","_sharedX3/GameMode/base"))..{
		InitCommand=cmd(addy,188;addx,16;);
	};
	LoadActor("icon")..{
		InitCommand=cmd(addx,-200;addy,130);
	};
	LoadActor("icon")..{
		InitCommand=cmd(blend,Blend.Add;;diffusealpha,0;addx,-200;addy,130);
		GainFocusCommand=cmd(queuecommand,"Anim");
		AnimCommand=cmd(rotationz,0;zoom,1;sleep,0.5;diffusealpha,0.5;linear,0.2;rotationz,360;linear,0.2;zoom,1.1;linear,0.2;diffusealpha,0;sleep,1;queuecommand,"Anim");
		LoseFocusCommand=cmd(stopeffect;stoptweening);
	};]]--
};
return t;
