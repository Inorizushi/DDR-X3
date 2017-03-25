local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("bnrframe")..{
    InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-138);
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(draworder,99;CenterX;y,SCREEN_CENTER_Y+130);
  OffCommand=cmd(sleep,0.15;linear,0.15;diffusealpha,0);
	Def.Sprite{
    Texture="arrow";
		InitCommand=cmd(x,224;rotationy,180;pause;setstate,0);
	};
  Def.Sprite{
    Texture="arrow";
		InitCommand=cmd(x,-224;pause;setstate,0);
	};
};

--Stage
t[#t+1] = Def.Sprite{
  InitCommand=cmd(pause;y,SCREEN_CENTER_Y-244;x,SCREEN_CENTER_X+296;halign,1;queuecommand,"Set");
  SetCommand=function(self)
  self:Load(THEME:GetPathG("","_shared2ndMIX/Stages 1x9"));
    local GetStage = GAMESTATE:GetCurrentStage();
    if GetStage == 'Stage_1st' then
      self:setstate(0);
    elseif GetStage == 'Stage_2nd' then
      self:setstate(1);
    elseif GetStage == 'Stage_3rd' then
      self:setstate(2);
    elseif GetStage == 'Stage_4th' then
      self:setstate(3);
    elseif GetStage == 'Stage_5th' then
      self:setstate(4);
    elseif GetStage == 'Stage_Final' then
      self:setstate(5);
    elseif GetStage == 'Stage_Extra1' then
      self:setstate(6);
    elseif GetStage == 'Stage_Extra2' then
      self:setstate(7);
    elseif GetStage == 'Stage_Event' then
      self:setstate(8);
    else
      self:visible(false)
    end;
  end;
};


--Style
t[#t+1] = Def.Sprite{
  InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-16;queuecommand,"Set");
  SetCommand=function(s)
    local style = GAMESTATE:GetCurrentStyle():GetStyleType()
    if style == 'StyleType_OnePlayerOneSide' then
      s:Load(THEME:GetPathG("","_shared2ndMIX/Styles/single"));
    elseif style == 'StyleType_TwoPlayersTwoSides' then
      s:Load(THEME:GetPathG("","_shared2ndMIX/Styles/versus"));
    elseif style == 'StyleType_OnePlayerTwoSides' then
      s:Load(THEME:GetPathG("","_shared2ndMIX/Styles/double"));
    elseif style == 'StyleType_TwoPlayersSharedSides' then
      s:Load(THEME:GetPathB("","_shared2ndMIX/Styles/couple"));
    end;
  end;
};
--Since we lock difficulty changes to Screen2ndMIXSelectGameMode, we just get the master player.
local PLAYER = GAMESTATE:GetMasterPlayerNumber()
t[#t+1] = Def.Sprite{
  Texture = "Basic";
  InitCommand=cmd(pause;visible,false;CenterX;y,SCREEN_BOTTOM-170;queuecommand,"Set");
  CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
  CurrentCourseChangedMessageCommand=cmd(queuecommand,"Set");
  CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
  CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
  SetCommand=function(self,params)
    local song = GAMESTATE:GetCurrentSong();
    local st = GAMESTATE:GetCurrentStyle():GetStepsType();
    local diff = GAMESTATE:GetCurrentSteps(PLAYER):GetDifficulty();
    if song then
      if diff == 'Difficulty_Beginner' then
        self:visible(true);
        self:Load(THEME:GetPathB("","Screen2ndMIXSelectMusic decorations/Beginner"));
      elseif diff == 'Difficulty_Easy' then
        self:visible(true);
        self:Load(THEME:GetPathB("","Screen2ndMIXSelectMusic decorations/basic"));
      elseif diff == 'Difficulty_Medium' then
        self:visible(true);
        self:Load(THEME:GetPathB("","Screen2ndMIXSelectMusic decorations/another"));
      elseif diff == 'Difficulty_Hard' then
        self:visible(true);
        self:Load(THEME:GetPathB("","Screen2ndMIXSelectMusic decorations/maniac"));
      elseif diff == 'Difficulty_Challenge' then
        self:visible(true);
        self:Load(THEME:GetPathB("","Screen2ndMIXSelectMusic decorations/Challenge"));
      else
        self:visible(false)
      end;
      local steps = song:GetOneSteps(GAMESTATE:GetCurrentStyle():GetStepsType(), diff)
      local meter = steps:GetMeter();
      self:setstate(math.min(meter-1, 9));
    else
      self:visible(false)
    end;
  end;
};

t[#t+1] = LoadActor("bottom")..{
  InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-64);
};

-- Dancer 1P
	t[#t+1]=Def.Sprite{
		InitCommand = cmd(player,PLAYER_1;vertalign,bottom;diffusealpha,0.75;x,SCREEN_CENTER_X-380;y,SCREEN_CENTER_Y+190;blend,Blend.Add);
		OnCommand =function(self)
			self:Load(THEME:GetPathG("","_Dancer/1Pdancer 24x1.png"));
			self:playcommand("Set");
		end;
		-- SetCommand base from DDR 5th MIX by AJ 187
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				local dispBpms = song:GetDisplayBpms()
				local bpmLimited = clamp(math.abs(dispBpms[2]),1,9999)
				local bps = (1/bpmLimited)*10;
				self:SetAllStateDelays(bps);
			else
				self:SetAllStateDelays(0.042);
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_1 then
				self:visible(true);
				(cmd(zoom,0;bounceend,0.3;zoom,1))(self);
			end;
		end;
		PlayerUnjoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_1 then
				self:visible(true);
				(cmd(bouncebegin,0.3;zoom,0))(self);
			end;
		end;
		OffCommand=cmd(diffusealpha,0);
	};
	-- Dancer 2P
	t[#t+1]=Def.Sprite{
		InitCommand = cmd(player,PLAYER_2;vertalign,bottom;zoom,1.5;diffuse,PlayerColor(PLAYER_2);diffusealpha,0.75;x,SCREEN_CENTER_X+240;y,SCREEN_CENTER_Y+43;blend,Blend.Add);
		OnCommand =function(self)
			local Ramdoms = {"A","B","C","D"}
			local RamdomDancer = Ramdoms[math.random(#Ramdoms)];
			self:Load(THEME:GetPathG("","_Dancer/2Pdancer"..RamdomDancer));
			self:playcommand("Set");
		end;
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				local dispBpms = song:GetDisplayBpms()
				local bpmLimited = clamp(math.abs(dispBpms[2]),1,9999)
				local bps = (1/bpmLimited)*5;
				self:SetAllStateDelays(bps);
			else
				self:SetAllStateDelays(0.042);
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:visible(true);
				(cmd(zoom,0;bounceend,0.3;zoom,1.5))(self);
			end;
		end;
		PlayerUnjoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:visible(true);
				(cmd(bouncebegin,0.3;zoom,0))(self);
			end;
		end;
		OffCommand=cmd(diffusealpha,0);
	};

  t[#t+1] = Def.ActorFrame{
  	LoadActor("../Screen2ndMIXSelectGameMode decorations/1P")..{
  		InitCommand=cmd(xy,SCREEN_CENTER_X-415,SCREEN_CENTER_Y+176;visible,false);
  		OnCommand=function(s) if GAMESTATE:IsPlayerEnabled(PLAYER_1) then s:visible(true) else s:visible(false) end; end;
  	};
  };
return t
