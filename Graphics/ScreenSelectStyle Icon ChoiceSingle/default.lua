local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,SCREEN_CENTER_X+80,SCREEN_CENTER_Y+40);
  LoadActor(THEME:GetPathG("","_sharedX3/SelectStyle/infomiddle"))..{
    InitCommand=cmd(diffusealpha,0.5);
  };
  LoadActor(THEME:GetPathG("","_sharedX3/SelectStyle/infotop"))..{
    InitCommand=cmd(y,-94);
  };
  LoadActor(THEME:GetPathG("","_sharedX3/SelectStyle/infobottom"))..{
    InitCommand=cmd(y,72);
  };
};

return t;
