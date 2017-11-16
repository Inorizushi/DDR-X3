local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,-20);
	OnCommand=cmd(addx,SCREEN_WIDTH*2.5;sleep,0.5;smooth,0.3;addx,-SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;zoomx,5;diffusealpha,0);

	-- Information panel
	Def.Sprite{
		InitCommand=cmd(addy,-36;addx,14);
		OnCommand=cmd(addy,10);
		GainFocusCommand=function(s) s:stoptweening():linear(0.2):addy(-10):zoom(1):Load(THEME:GetPathG("ScreenSelectGameMode","Scroll/Happy/char.png")) end;
		LoseFocusCommand=function(s) s:stoptweening():linear(0.2):addy(10):zoom(0.75):Load(THEME:GetPathG("ScreenSelectGameMode","Scroll/Happy/char dark.png")) end;
	};
	Def.ActorFrame{
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,true);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,false);
		LoadActor(THEME:GetPathG("","_sharedX3/GameMode/base"))..{
			InitCommand=cmd(addy,188;addx,16;diffusealpha,1);
		};
		LoadActor("text.png")..{
			InitCommand=cmd(addy,191;addx,54;);
		};
		LoadActor("text glow.png")..{
			InitCommand=cmd(blend,Blend.Add;;diffuse,color("1,1,1,0.5");addy,191;addx,54;zoom,1.01;);
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
			InitCommand=cmd(addy,186;addx,20;);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(addx,-200;addy,130;visible,false);
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
			OnCommand=cmd(queuecommand,"Anim");
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
	Def.ActorFrame{
		InitCommand=cmd(x,-200;y,50);
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,true);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,false);
		LoadActor("H.png")..{
			InitCommand=cmd(x,-80;y,34);
			GainFocusCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,0.5;linear,0.2;addy,-40;zoomx,1.3;zoomy,0.5;linear,0.2;addy,40;zoomy,1;zoomx,1;sleep,0.4;sleep,1.5;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("A.png")..{
			InitCommand=cmd(x,-36;y,16);
			GainFocusCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,0.55;linear,0.2;addy,-40;zoomx,1.3;zoomy,0.5;linear,0.2;addy,40;zoomy,1;zoomx,1;sleep,0.4;sleep,1.45;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("P1.png")..{
			InitCommand=cmd(x,0;y,6);
			GainFocusCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,0.6;linear,0.2;addy,-40;zoomx,1.3;zoomy,0.5;linear,0.2;addy,40;zoomy,1;zoomx,1;sleep,0.4;sleep,1.4;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("P2.png")..{
			InitCommand=cmd(x,36;y,8);
			GainFocusCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,0.65;linear,0.2;addy,-40;zoomx,1.3;zoomy,0.5;linear,0.2;addy,40;zoomy,1;zoomx,1;sleep,0.4;sleep,1.35;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("Y.png")..{
			InitCommand=cmd(x,76;y,26);
			GainFocusCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,0.7;linear,0.2;addy,-40;zoomx,1.3;zoomy,0.5;linear,0.2;addy,40;zoomy,1;zoomx,1;sleep,0.4;sleep,1.3;queuecommand,"Anim");
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
