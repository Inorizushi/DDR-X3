return Def.ActorFrame {
 	LoadFont("_helveticaneuelt pro 65 md Bold 24px") .. {
		Name="TextTitle";
		InitCommand=cmd(y,-16.5;zoom,1;maxwidth,256/0.875;shadowlength,1;zoomy,0;diffusealpha,1);
		OnCommand=cmd(sleep,0.333;decelerate,0.133;diffusealpha,1;accelerate,0.033;zoomy,1.07;zoomx,1.07;decelerate,0.033;zoomx,1;zoomy,1);
    OffCommand=cmd(sleep,0.0000;sleep,0.333;decelerate,0.066;zoom,1.05;diffusealpha,0);
-- 		TickCommand=cmd(finishtweening;diffusealpha,0;addx,-10;zoomx,1.25;zoomy,0;decelerate,0.25;diffusealpha,1;addx,10;zoom,1;sleep,0;glow,Color("White");decelerate,0.275;glow,Color("Invisible"));
	};
 	LoadFont("_helveticaneuelt pro 65 md Bold 24px") .. {
		Name="TextSubtitle";
		InitCommand=cmd(zoom,0.5;maxwidth,256/0.5;shadowlength,1;zoomy,0;diffusealpha,1);
		OnCommand=cmd(sleep,0.333;decelerate,0.133;diffusealpha,1;accelerate,0.033;zoomy,0.57;zoomx,0.57;decelerate,0.033;zoomx,0.5;zoomy,0.5);
    OffCommand=cmd(sleep,0.0000;sleep,0.333;decelerate,0.066;zoom,1.05;diffusealpha,0);
-- 		TickCommand=cmd(finishtweening;diffusealpha,0;addy,-10;addx,10;decelerate,0.25;diffusealpha,1;addy,10;addx,-10);
	};
	LoadFont("_helveticaneuelt pro 65 md Bold 24px") .. {
		Name="TextArtist";
		InitCommand=cmd(y,18;zoom,0.75;maxwidth,256/0.75;shadowlength,1;zoomy,0;diffusealpha,1);
		OnCommand=cmd(sleep,0.333;decelerate,0.133;diffusealpha,1;accelerate,0.033;zoomy,0.82;zoomx,0.82;decelerate,0.033;zoomx,0.75;zoomy,0.75);
    OffCommand=cmd(sleep,0.0000;sleep,0.333;decelerate,0.066;zoom,1.05;diffusealpha,0);
-- 		TickCommand=cmd(finishtweening;diffusealpha,0;addy,10;addx,10;decelerate,0.25;diffusealpha,1;addy,-10;addx,-10);
	};
};
