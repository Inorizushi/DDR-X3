local t = Def.ActorFrame {
	LoadActor( "DDR X3.avi" )..{
		InitCommand=cmd(Center;setsize,1280,720);
	};
};

t[#t+1] = Def.ActorFrame{
	LoadActor( "back" )..{
		InitCommand=cmd(Center);
	};
	LoadActor( "right bg" )..{
		InitCommand=cmd(diffusealpha,0.5;xy,SCREEN_CENTER_X-360,SCREEN_CENTER_Y-200);
	};
	LoadActor( "right bg" )..{
		InitCommand=cmd(diffusealpha,0.5;xy,SCREEN_CENTER_X+330,SCREEN_CENTER_Y-120);
	};
	Def.ActorFrame{
		LoadActor("LargeCircle")..{
			InitCommand=cmd(xy,SCREEN_CENTER_X-128,SCREEN_CENTER_Y-114);
      OnCommand=cmd(linear,4;addy,-90;linear,4;addy,90;queuecommand,"On");
		};
    LoadActor("lined circle")..{
			InitCommand=cmd(xy,SCREEN_CENTER_X+218,SCREEN_CENTER_Y-84);
      OnCommand=cmd(linear,4;addy,-60;linear,4;addy,60;queuecommand,"On");
		};
    LoadActor("lined circle")..{
			InitCommand=cmd(xy,SCREEN_CENTER_X+484,SCREEN_CENTER_Y-258);
      OnCommand=cmd(linear,4;addy,-30;linear,4;addy,30;queuecommand,"On");
		};
    LoadActor("small blue")..{
			InitCommand=cmd(xy,SCREEN_CENTER_X-316,SCREEN_CENTER_Y-94);
      OnCommand=cmd(linear,4;addy,-50;linear,4;addy,50;queuecommand,"On");
		};
    LoadActor("small blue")..{
			InitCommand=cmd(zoom,1.4;xy,SCREEN_CENTER_X-584,SCREEN_CENTER_Y-178);
      OnCommand=cmd(linear,4;addy,-76;linear,4;addy,76;queuecommand,"On");
		};
    LoadActor("small blue")..{
			InitCommand=cmd(xy,SCREEN_CENTER_X+92,SCREEN_CENTER_Y-32);
      OnCommand=cmd(linear,4;addy,-20;linear,4;addy,20;queuecommand,"On");
		};
    LoadActor("small lb")..{
			InitCommand=cmd(zoom,1.2;xy,SCREEN_CENTER_X+80,SCREEN_CENTER_Y-270);
      OnCommand=cmd(linear,4;addy,-60;linear,4;addy,60;queuecommand,"On");
		};
    LoadActor("small lb")..{
			InitCommand=cmd(zoom,0.9;xy,SCREEN_CENTER_X+388,SCREEN_CENTER_Y-320);
      OnCommand=cmd(linear,4;addy,-30;linear,4;addy,30;queuecommand,"On");
		};
	};
  LoadActor("gaped circle S")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X+80,SCREEN_CENTER_Y-160);
    OnCommand=cmd(linear,4;addy,-70;linear,4;addy,70;queuecommand,"On");
  };
	LoadActor("Circle1")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X+184,SCREEN_CENTER_Y-232;zoom,1);
    OnCommand=cmd(linear,3;addy,-40;linear,3;addy,40;queuecommand,"On");
	};
	LoadActor("gaped circle.png")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X-258,SCREEN_CENTER_Y-28);
    OnCommand=cmd(linear,3;addy,48;linear,5;addy,-96;linear,3;addy,48;queuecommand,"On");
	};
	LoadActor("top left fg")..{
		InitCommand=cmd(halign,0;valign,0;x,SCREEN_LEFT;y,SCREEN_TOP);
	};
  LoadActor("Circle3")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-460,SCREEN_CENTER_Y+38);
    OnCommand=cmd(linear,4;addy,-120;linear,4;addy,120;queuecommand,"On");
  };
	LoadActor("bottom right fg")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X+402,SCREEN_CENTER_Y-26);
	};
  LoadActor("Circle3")..{
    InitCommand=cmd(zoom,0.8;xy,SCREEN_CENTER_X+400,SCREEN_CENTER_Y-140);
    OnCommand=cmd(linear,3;addy,80;linear,3;addy,-80;queuecommand,"On");
  };

	LoadActor("reflection base")..{
		InitCommand=cmd(Center);
	};
};

return t;
