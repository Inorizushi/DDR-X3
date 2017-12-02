local t = Def.ActorFrame{
		-- Def.Quad{
		-- InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		-- OnCommand=cmd(linear,5;diffusealpha,1);
	-- };

	-- Cleared song --
    LoadActor("../ClearedSong.mp3") .. {
		StartTransitioningCommand=cmd(sleep,0.2;queuecommand,"Play");
    PlayCommand=cmd(play);
	};
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center);
  OnCommand=cmd(sleep,2.6;queuecommand,"Vib");
  VibCommand=cmd(linear,0.05;addy,10;linear,0.05;addy,-20;linear,0.05;addy,20;linear,0.05;addy,-10;sleep,0.3;);
  StopThatCommand=cmd(stopeffect);
  LoadActor(THEME:GetPathB("","Common doors/door 5.png"))..{
     OnCommand=cmd(rotationz,0;zoom,0;linear,0.5;zoom,0.0;rotationz,-20;sleep,2.05;zoom,1;linear,0.04;rotationz,0);
  };
  LoadActor(THEME:GetPathB("","Common doors/door 3.png"))..{
    OnCommand=cmd(zoom,0;rotationz,080;linear,0.5;zoom,0.0;rotationz,90;sleep,2.05;zoom,1;linear,0.04;rotationz,0);
  };
  LoadActor(THEME:GetPathB("","Common doors/door 2.png"))..{
   OnCommand=cmd(diffusealpha,0;rotationz,-110;zoom,2;sleep,2.25;diffusealpha,1;linear,0.3;zoom,1.2;rotationz,-050;linear,0.039;zoom,1;rotationz,0);
  };
  LoadActor(THEME:GetPathB("","Common doors/door 1.png"))..{
   OnCommand=cmd(zoom,5;sleep,2;linear,0.2;zoom,1.8;linear,0.2;zoom,1;rotationz,0);
  };

};
	--------CLEARED-----------
t[#t+1] = Def.ActorFrame{
--Cleared--
	LoadActor("Cleared") .. {
	InitCommand=function(self)
		local Song;
		if GAMESTATE:IsCourseMode() then
			song = GAMESTATE:GetCurrentCourse();
		else
			song = GAMESTATE:GetCurrentSong();
		end;
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_CENTER_Y);
			if song:GetDisplayFullTitle() == "Tohoku EVOLVED" then
				self:visible(false);
			else
				self:visible(true);
		end;
	end;
	};
--tohoku--
	LoadActor("Tohoku") .. {
	InitCommand=function(self)
	if not GAMESTATE:IsCourseMode() then
		local song = GAMESTATE:GetCurrentSong();
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_CENTER_Y);
			if song:GetDisplayFullTitle() == "Tohoku EVOLVED" then
				self:visible(true);
			else
				self:visible(false);
		end;
	else
		self:diffusealpha(0);
	end;
	end;
	};

};

return t;
