local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("DANCE.ogg")..{
    OnCommand=cmd(sleep,0.8;queuecommand,'Play');
    PlayCommand=cmd(play);
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center;diffusealpha,1);
  LoadActor("bg.png");
  LoadActor("bgarrows.png")..{
    OnCommand=cmd(diffusealpha,0;sleep,0.4;diffusealpha,1;queuecommand,"Anim");
    AnimCommand=cmd(sleep,0.2;glowshift;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,0.5");effectperiod,3;);
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,SCREEN_CENTER_X+5,SCREEN_CENTER_Y-26);
  OnCommand=cmd(diffusealpha,0;zoom,3;sleep,0.3;linear,0.15;diffusealpha,1;zoom,2;linear,0.1;zoom,1);
  LoadActor("glow")..{
    OnCommand=cmd(diffusealpha,0;sleep,0.3;linear,0.1;diffusealpha,1);
  };
  LoadActor("logo");
  LoadActor("whitelogo")..{
    OnCommand=cmd(diffusealpha,0;sleep,0.3;linear,0.1;diffusealpha,1;sleep,0.1;linear,0.2;diffusealpha,0);
  };
  LoadActor("textglow")..{
    OnCommand=cmd(diffusealpha,0;sleep,1;linear,0.2;fadeleft,0;faderight,1;diffusealpha,1;linear,2;faderight,0;fadeleft,1;linear,0.2;diffusealpha,0;queuecommand,"On");
  };
};

t[#t+1] = LoadActor("dancer")..{
  InitCommand=cmd(valign,0;xy,SCREEN_CENTER_X+334,SCREEN_CENTER_Y-98);
  OnCommand=cmd(zoomy,0;sleep,0.5;linear,0.1;zoomy,1);
};

t[#t+1] = LoadActor("start")..{
  InitCommand=cmd(x,SCREEN_CENTER_X-1;y,SCREEN_BOTTOM-90);
  OnCommand=cmd(zoomy,0;sleep,0.8;linear,0.1;zoomy,1;queuecommand,"Anim");
  AnimCommand=cmd(sleep,0.2;glowshift;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,0.3");effectperiod,1.5;);
};

setenv("MIXMODE",true);

return t;
