local counter = 0;
local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
	Def.ActorFrame{
		LoadActor("../ScreenWithMenuElements background/DDR X3.avi")..{
			InitCommand=cmd(Center;setsize,1280,720);
		};
	};
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-60);
  LoadActor("logo back");
  Def.ActorFrame{
    LoadActor("X3")..{
      InitCommand=cmd(x,-224;y,-10);
    };
    LoadActor("2ndMIX")..{
      InitCommand=cmd(x,310;y,102);
    };
    LoadActor("VS")..{
      InitCommand=cmd(x,132;y,-28);
    };
    LoadActor("logo glow")..{
      OnCommand=cmd(diffusealpha,0;playcommand,"Animate");
      AnimateCommand=cmd(sleep,0.5;linear,1;blend,'BlendMode_Add';diffusealpha,0.25;linear,1;diffusealpha,0;queuecommand,"Animate");
    };
  };
};

t[#t+1] = LoadActor("copyright")..{
  InitCommand=cmd(x,SCREEN_CENTER_X+8;y,SCREEN_BOTTOM-48);
};

return t;
