local t = Def.ActorFrame{
	InitCommand=cmd(x,-20);
	OnCommand=cmd(addx,-SCREEN_WIDTH*2.5;sleep,0.5;linear,0.1;addx,SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;diffusealpha,0);

	-- Information panel
	LoadActor("Happy icon")..{
		GainFocusCommand=function(s) s:linear(0.2):zoom(1):diffuse(color("1,1,1,1")); end;
		LoseFocusCommand=function(s) s:finishtweening():linear(0.2):zoom(0.75):diffuse(color("0.6,0.6,0.6,1")); end;
	};
	--[[LoadActor("char")..{
		InitCommand=cmd(addy,-36;addx,14);
	};
	LoadActor("base")..{
		InitCommand=cmd(addy,190;addx,14;zoomx,1.12;zoomy,1.12);
	};
	LoadActor("icon")..{
		InitCommand=cmd(addx,-200;addy,130);
	};]]--
};
return t;
