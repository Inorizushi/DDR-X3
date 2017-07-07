local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,-20);
	OnCommand=cmd(addx,-SCREEN_WIDTH*2.5;sleep,0.5;smooth,0.3;addx,SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;zoomx,5;diffusealpha,0);
	-- Information panel
	LoadActor("char")..{
		InitCommand=cmd(addy,-38;addx,16);
		GainFocusCommand=function(s) s:stoptweening():linear(0.2):addy(-10):zoom(1):diffuse(color("1,1,1,1")); end;
		LoseFocusCommand=function(s) s:stoptweening():linear(0.2):addy(10):zoom(0.75):diffuse(color("0.6,0.6,0.6,1")); end;
	};
	Def.ActorFrame{
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,true);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,false);
		LoadActor(THEME:GetPathG("","_sharedX3/GameMode/base"))..{
			InitCommand=cmd(addy,184;addx,22;);
		};
		LoadActor("text")..{
			InitCommand=cmd(addy,184;addx,36;);
		};
	};
	Def.ActorFrame{
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,false);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,true);
		LoadActor("unfocused base")..{
			InitCommand=cmd(addy,184;addx,22;);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(addx,-196;addy,122);
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,true);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,false);
		LoadActor("icon");
		LoadActor("icon")..{
			InitCommand=cmd(blend,Blend.Add;;diffusealpha,0);
			GainFocusCommand=cmd(stoptweening;queuecommand,"Anim");
			AnimCommand=cmd(rotationz,0;zoom,1;sleep,2.2;diffusealpha,0.5;linear,0.2;rotationz,360;linear,0.2;zoom,1.1;linear,0.2;diffusealpha,0;sleep,2.2;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(addx,-146;addy,90);
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,false);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,true);
		LoadActor("unfocused icon");
	};
	Def.ActorFrame{
		InitCommand=cmd(x,-200;y,50);
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,true);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,false);
		LoadActor("P.png")..{
			InitCommand=cmd(x,-54;y,20);
			GainFocusCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,2;linear,0.2;addy,-40;zoomx,1.3;zoomy,0.5;linear,0.2;addy,40;zoomy,1;zoomx,1;sleep,0.4;sleep,2;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("R.png")..{
			InitCommand=cmd(x,3;y,2);
			GainFocusCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,2.05;linear,0.2;addy,-40;zoomx,1.3;zoomy,0.5;linear,0.2;addy,40;zoomy,1;zoomx,1;sleep,0.4;sleep,1.95;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("O.png")..{
			InitCommand=cmd(x,60;y,14);
			GainFocusCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,2.1;linear,0.2;addy,-40;zoomx,1.3;zoomy,0.5;linear,0.2;addy,40;zoomy,1;zoomx,1;sleep,0.4;sleep,1.9;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(x,-146;y,48);
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,false);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,true);
		LoadActor("letters unfocused");
	};
};

return t;
