local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("DANCE.ogg")..{
    OnCommand=cmd(sleep,0.8;queuecommand,'Play');
    PlayCommand=cmd(play);
  };
};
return t;
