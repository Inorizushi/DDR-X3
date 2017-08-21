return Def.ActorFrame {
 	LoadFont("_helveticaneuelt pro 65 md Bold 24px") .. {
		Name="TextTitle";
		InitCommand=cmd(y,-16.5;zoom,1;maxwidth,256/0.875;);
		OnCommand=cmd(shadowlength,1);
-- 		TickCommand=cmd(finishtweening;diffusealpha,0;addx,-10;zoomx,1.25;zoomy,0;decelerate,0.25;diffusealpha,1;addx,10;zoom,1;sleep,0;glow,Color("White");decelerate,0.275;glow,Color("Invisible"));
	};
 	LoadFont("_helveticaneuelt pro 65 md Bold 24px") .. {
		Name="TextSubtitle";
		InitCommand=cmd(zoom,0.5;maxwidth,256/0.5);
		OnCommand=cmd(shadowlength,1);
-- 		TickCommand=cmd(finishtweening;diffusealpha,0;addy,-10;addx,10;decelerate,0.25;diffusealpha,1;addy,10;addx,-10);
	};
	LoadFont("_helveticaneuelt pro 65 md Bold 24px") .. {
		Name="TextArtist";
		InitCommand=cmd(y,18;zoom,0.75;maxwidth,256/0.75);
		OnCommand=cmd(shadowlength,1);
-- 		TickCommand=cmd(finishtweening;diffusealpha,0;addy,10;addx,10;decelerate,0.25;diffusealpha,1;addy,-10;addx,-10);
	};
};
