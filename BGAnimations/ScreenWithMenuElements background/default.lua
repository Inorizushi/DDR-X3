return Def.ActorFrame{
	Def.Sprite{
		Texture="back",
		InitCommand=function(s) s:setsize(SCREEN_WIDTH,480):xy(_screen.cx,SCREEN_TOP):valign(0) end,
	};
	Def.Sprite{
		Texture="loopdydoothingamabob (stretch)",
		InitCommand=function(s)
			s:xy(_screen.cx,_screen.cy-200):setsize(SCREEN_WIDTH,60)
			:customtexturerect(0,0,1,1):texcoordvelocity(0.2,0)
		end,
	},
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
		Def.ActorFrame{
			InitCommand=cmd(xy,SCREEN_CENTER_X+218,SCREEN_CENTER_Y-84);
		  	OnCommand=cmd(linear,4;addy,-60;linear,4;addy,60;queuecommand,"On");
			Def.ActorFrame{
				Name="Fade",
				InitCommand=function(s) s:diffuse(color("#40c5cd")) end,
				OnCommand=function(s) s:finishtweening():zoom(0.5):sleep(3):linear(2):zoom(1):queuecommand("On") end,
				Def.Sprite{
					Texture="fadecircle",
					InitCommand=function(s) s:zoom(0.5):diffusealpha(0) end,
					OnCommand=function(s) s:finishtweening():sleep(3):linear(0.6):diffusealpha(1)
						:sleep(1):linear(0.4):diffusealpha(0):queuecommand("On")
					end,
				};
				Def.Sprite{
					Texture="fadecircle",
					InitCommand=function(s) s:zoom(0.75):diffusealpha(0) end,
					OnCommand=function(s) s:finishtweening():sleep(3):linear(0.6):diffusealpha(1)
						:sleep(1):linear(0.4):diffusealpha(0):queuecommand("On")
					end,
				};
				Def.Sprite{
					Texture="fadecircle",
					InitCommand=function(s) s:diffusealpha(0) end,
					OnCommand=function(s) s:finishtweening():sleep(3):linear(0.6):diffusealpha(1)
						:sleep(1):linear(0.4):diffusealpha(0):queuecommand("On")
					end,
				};
			};
			Def.Sprite{
				Texture="lined circle",
			};
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
	Def.ActorFrame{
		Name="Fade",
		InitCommand=function(s) s:xy(SCREEN_LEFT+100,SCREEN_TOP+100):diffuse(color("#40c5cd")) end,
		OnCommand=function(s) s:finishtweening():zoom(0.5):sleep(3):linear(2):zoom(1):queuecommand("On") end,
		Def.Sprite{
			Texture="fadecircle",
			InitCommand=function(s) s:zoom(0.5):diffusealpha(0) end,
			OnCommand=function(s) s:finishtweening():sleep(3):linear(0.6):diffusealpha(1)
				:sleep(1):linear(0.4):diffusealpha(0):queuecommand("On")
			end,
		};
		Def.Sprite{
			Texture="fadecircle",
			InitCommand=function(s) s:zoom(0.75):diffusealpha(0) end,
			OnCommand=function(s) s:finishtweening():sleep(3):linear(0.6):diffusealpha(1)
				:sleep(1):linear(0.4):diffusealpha(0):queuecommand("On")
			end,
		};
		Def.Sprite{
			Texture="fadecircle",
			InitCommand=function(s) s:diffusealpha(0) end,
			OnCommand=function(s) s:finishtweening():sleep(3):linear(0.6):diffusealpha(1)
				:sleep(1):linear(0.4):diffusealpha(0):queuecommand("On")
			end,
		};
	};
  LoadActor("Circle3")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-460,SCREEN_CENTER_Y+38);
    OnCommand=cmd(linear,4;addy,-120;linear,4;addy,120;queuecommand,"On");
  };
	LoadActor("bottom right fg")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X+402,SCREEN_CENTER_Y-26);
	};
	Def.ActorFrame{
		InitCommand=function(s) s:Center():rotationz(-45) end,
		Def.ActorFrame{
			Name="RightSide",
			InitCommand=function(s) s:y(300) end,
			Def.Sprite{
				Texture="zoomer",
				InitCommand=function(s)
					s:queuecommand("Anim")
				end,
				AnimCommand=function(s) s:x(SCREEN_RIGHT-300):sleep(3):linear(0.4):x(SCREEN_LEFT-650):sleep(6.2):queuecommand("Anim") end,
			},
			Def.Sprite{
				Texture="zoomer",
				InitCommand=function(s)
					s:y(60)
					s:queuecommand("Anim")
				end,
				AnimCommand=function(s) s:x(SCREEN_RIGHT-300):sleep(3.2):linear(0.4):x(SCREEN_LEFT-650):sleep(6):queuecommand("Anim") end,
			},
		};
		Def.ActorFrame{
			Name="MiddleSide",
			Def.Sprite{
				Texture="zoomer",
				InitCommand=function(s)
					s:queuecommand("Anim")
				end,
				AnimCommand=function(s) s:x(SCREEN_RIGHT-300):sleep(6):linear(0.4):x(SCREEN_LEFT-650):sleep(3.2):queuecommand("Anim") end,
			},
			Def.Sprite{
				Texture="zoomer",
				InitCommand=function(s)
					s:y(60)
					s:queuecommand("Anim")
				end,
				AnimCommand=function(s) s:x(SCREEN_RIGHT-300):sleep(6.2):linear(0.4):x(SCREEN_LEFT-650):sleep(3):queuecommand("Anim") end,
			},
		};
		Def.ActorFrame{
			Name="LeftSide",
			InitCommand=function(s) s:xy(-200,-600) end,
			Def.Sprite{
				Texture="zoomer",
				InitCommand=function(s)
					s:y(60)
					s:queuecommand("Anim")
				end,
				AnimCommand=function(s) s:x(SCREEN_RIGHT-300):sleep(9):linear(0.4):x(SCREEN_LEFT-650):sleep(0.2):queuecommand("Anim") end,
			},
			Def.Sprite{
				Texture="zoomer",
				InitCommand=function(s)
					s:queuecommand("Anim")
				end,
				AnimCommand=function(s) s:x(SCREEN_RIGHT-300):sleep(9.2):linear(0.4):x(SCREEN_LEFT-650):queuecommand("Anim") end,
			},
		}
	};
  	LoadActor("Circle3")..{
    	InitCommand=cmd(zoom,0.8;xy,SCREEN_CENTER_X+400,SCREEN_CENTER_Y-140);
    	OnCommand=cmd(linear,3;addy,80;linear,3;addy,-80;queuecommand,"On");
  	};
	Def.Sprite{
		Texture="reflection base",
		InitCommand=function(s) s:setsize(SCREEN_WIDTH,240):xy(_screen.cx,SCREEN_BOTTOM):valign(1) end,
	};
};
