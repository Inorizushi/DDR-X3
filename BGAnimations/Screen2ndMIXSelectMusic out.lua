local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("2nd doors")..{
    InitCommand=cmd(setsize,1280,720;CenterY;cropright,0.5;CenterX);
    OnCommand=cmd(addx,-SCREEN_WIDTH;linear,0.4;addx,SCREEN_WIDTH);
  };
  LoadActor("2nd doors")..{
    InitCommand=cmd(setsize,1280,720;CenterY;cropleft,0.5;CenterX);
    OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.4;addx,-SCREEN_WIDTH);
  };
  LoadActor("ScreenStageInformation in/DONK")..{
		OnCommand=cmd(sleep,0.4;queuecommand,("Play"));
		PlayCommand=cmd(play;);
	};
};

return t
