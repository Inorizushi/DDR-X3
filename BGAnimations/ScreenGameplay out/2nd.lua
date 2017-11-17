local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("../2nd doors")..{
    InitCommand=cmd(setsize,1280,720;CenterY;cropright,0.5;CenterX);
    OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,4;linear,1.5;addx,SCREEN_WIDTH);
  };
  LoadActor("../2nd doors")..{
    InitCommand=cmd(setsize,1280,720;CenterY;cropleft,0.5;CenterX);
    OnCommand=cmd(addx,SCREEN_WIDTH;sleep,4;linear,1.5;addx,-SCREEN_WIDTH);
  };
  LoadActor("../failed")..{
    OnCommand=cmd(sleep,4;queuecommand,"Play");
    PlayCommand=cmd(play);
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor("MIXCleared")..{
    InitCommand=cmd(Center);
    OnCommand=cmd(diffusealpha,0;sleep,4;diffusealpha,1;sleep,4);
  };
};

return t
