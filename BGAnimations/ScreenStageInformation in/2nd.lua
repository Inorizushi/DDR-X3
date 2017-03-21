local playMode = GAMESTATE:GetPlayMode()
if playMode ~= 'PlayMode_Regular' and playMode ~= 'PlayMode_Rave' and playMode ~= 'PlayMode_Battle' then
	curStage = playMode;
end;
local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;

local t = Def.ActorFrame {
	LoadActor("base")..{
		InitCommand=cmd(Center);
	};
};
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:sleep(3.01);
	end;

	---- DOOR OPEN > CLOSE  CLOSE > OPEN
	LoadActor(THEME:GetPathB("","2nd doors"))..{
		InitCommand=cmd(Center);
	};
	LoadActor(("DONK"))..{
		OnCommand=cmd(queuecommand,("Play"));
		PlayCommand=cmd(play;);
	};
	--- Flash SONG BANNER  sound------
	LoadActor("SoundStage") .. {
	};
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(zoom,1.5;CenterX;y,SCREEN_CENTER_Y+120;);
	OnCommand=cmd(addy,-SCREEN_HEIGHT;sleep,0.099;sleep,0.396;smooth,0.4;addy,SCREEN_HEIGHT);
	LoadActor(THEME:GetPathG("","MusicWheelItem Song NormalPart/cd/cd_mask"))..{
		InitCommand=cmd(blend,Blend.NoEffect;zwrite,1;clearzbuffer,true;);
	};
	Def.Sprite{
		InitCommand=cmd(ztest,1);
		OnCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
			if song then
				if song:HasJacket() then
					self:Load(song:GetJacketPath());
					self:setsize(256,256);
					self:diffusealpha(1);
				elseif song:HasBackground() then
					--Verify BG
					self:Load(song:GetBackgroundPath());
					self:setsize(256,256);
					self:diffusealpha(1);
				else
					--Fallback CD
					self:Load(THEME:GetPathG("", "MusicWheelItem Song NormalPart/cd/fallback"));
				end;
			end;
		end;
	};
	LoadActor(THEME:GetPathG("", "MusicWheelItem Song NormalPart/cd/overlay"));
};

t[#t+1] = LoadActor(THEME:GetPathB("","Screen2ndMIXSelectMusic decorations/bnrframe.png"))..{
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-138);
	OnCommand=cmd(diffusealpha,0;sleep,0.099;sleep,0.396;diffusealpha,1);
};
if not GAMESTATE:IsCourseMode() then
--song jacket--
t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(playcommand,'Set';CenterX;y,SCREEN_CENTER_Y-138;diffusealpha,0;sleep,0.099;sleep,0.396;diffusealpha,1);
	Def.Sprite {
		SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
			if song:HasBanner() then
				self:LoadFromSongBanner(GAMESTATE:GetCurrentSong());
				self:scaletoclipped(576,165);
			else
				self:Load(THEME:GetPathG("","Common fallback banner"));
				self:scaletoclipped(576,165);
			end;
		end;
	};
};
else
t[#t+1] = LoadActor("CourseDisplay");
end;

t[#t+1] = Def.Sprite{
  InitCommand=cmd(pause;y,SCREEN_CENTER_Y-244;x,SCREEN_CENTER_X+296;halign,1);
  OnCommand=cmd(playcommand,"Set";diffusealpha,0;sleep,0.099;sleep,0.396;diffusealpha,1);
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

t[#t+1] = Def.Sprite{
  InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-16);
  OnCommand=cmd(playcommand,"Set";diffusealpha,0;sleep,0.099;sleep,0.396;diffusealpha,1);
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

local PLAYER = GAMESTATE:GetMasterPlayerNumber()
t[#t+1] = Def.Sprite{
  InitCommand=cmd(pause;visible,false;CenterX;y,SCREEN_BOTTOM-170;playcommand,"Set");
	OnCommand=cmd(diffusealpha,0;sleep,0.099;sleep,0.396;diffusealpha,1);
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
      if meter == 1 then
        self:setstate(0)
      elseif meter == 2 then
        self:setstate(1)
      elseif meter == 3 then
        self:setstate(2)
      elseif meter == 4 then
        self:setstate(3)
      elseif meter == 5 then
        self:setstate(4)
      elseif meter == 6 then
        self:setstate(5)
      elseif meter == 7 then
        self:setstate(6)
      elseif meter == 8 then
        self:setstate(7)
      elseif meter == 9 then
        self:setstate(8)
      elseif meter >= 10 then
        self:setstate(9)
      end;
    else
      self:visible(false)
    end;
  end;
};

--No mods for you ecksdee
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = Def.Actor{
		OnCommand=function(self)
			GAMESTATE:ApplyStageModifiers(pn,"1x,noholds")
		end;
	};
end;

return t
