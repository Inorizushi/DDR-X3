local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center;zoom,1.02);
  OnCommand=cmd(sleep,0.6;queuecommand,"Vib");
  VibCommand=cmd(linear,0.05;addy,10;linear,0.05;addy,-20;linear,0.05;addy,20;linear,0.05;addy,-10;sleep,0.3;);
  LoadActor("Common doors/door 5.png")..{
	   OnCommand=cmd(rotationz,0;zoom,0;linear,0.5;zoom,0.0;rotationz,-20;sleep,0.05;zoom,1;linear,0.04;rotationz,0);
	};
  LoadActor("Common doors/door 3.png")..{
    OnCommand=cmd(zoom,0;rotationz,080;linear,0.5;zoom,0.0;rotationz,90;sleep,0.05;zoom,1;linear,0.04;rotationz,0);
  };
  LoadActor("Common doors/door 2.png")..{
	 OnCommand=cmd(diffusealpha,0;rotationz,-110;zoom,2;sleep,0.25;diffusealpha,1;linear,0.3;zoom,1.2;rotationz,-050;linear,0.039;zoom,1;rotationz,0);
	};
  LoadActor("Common doors/door 1.png")..{
	 OnCommand=cmd(zoom,5;linear,0.2;zoom,1.8;linear,0.2;zoom,1;rotationz,0);
	};
};

return t
