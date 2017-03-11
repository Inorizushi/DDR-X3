local t = Def.ActorFrame {
	LoadActor( "DDR X3.avi" )..{
		InitCommand=cmd(Center;setsize,1280,720);
	};
};

t[#t+1] = Def.ActorFrame{
	LoadActor( "back" )..{
		InitCommand=cmd(Center;diffusealpha,1);
	};
	LoadActor( "top left bg" )..{
		InitCommand=cmd(Center;diffusealpha,0.25);
	};
	LoadActor( "right bg" )..{
		InitCommand=cmd(Center;diffusealpha,0.25);
	};
	LoadActor("Layer1")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(queuecommand,"Anim");
		AnimCommand=cmd(linear,3;addy,-80;linear,6;addy,160;linear,3;addy,-80;queuecommand,"Anim");
	};
	LoadActor("Circle1")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X+190,SCREEN_CENTER_Y-240;zoom,0.8);
		OnCommand=cmd(queuecommand,"Anim");
		AnimCommand=cmd(linear,2;addy,-20;linear,2;addy,20;linear,2;addy,-20;linear,2;addy,24;linear,0.4;addy,-4;queuecommand,"Anim");
	};
	LoadActor("Circle2")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X-254,SCREEN_CENTER_Y+15);
		OnCommand=cmd(queuecommand,"Anim");
		AnimCommand=cmd(linear,2;addy,40;linear,4;addy,-120;linear,3;addy,80;queuecommand,"Anim");
	};
	LoadActor( "top left fg" )..{
		InitCommand=cmd(Center);
	};
	LoadActor( "bottom right fg" )..{
		InitCommand=cmd(Center);
	};
	LoadActor( "reflection base" )..{
		InitCommand=cmd(Center);
	};
};

return t;
