local t = Def.ActorFrame{
	InitCommand=cmd(x,-20);
	OnCommand=cmd(addx,SCREEN_WIDTH*2.5;sleep,0.5;linear,0.1;addx,-SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;diffusealpha,0);
	-- Information panel
	LoadActor("2ndMIX icon")..{
		GainFocusCommand=function(s) s:linear(0.2):zoom(1):diffuse(color("1,1,1,1")); end;
		LoseFocusCommand=function(s) s:finishtweening():linear(0.2):zoom(0.75):diffuse(color("0.6,0.6,0.6,1")); end;
		OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;diffusealpha,0);
	};
};

return t;
