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
local t = Def.ActorFrame {};
if Is2ndMIX() then
	t[#t+1] =Def.ActorFrame{
		LoadActor(THEME:GetPathB("","_2ndDoorsopen"));
	};
else
	t[#t+1] =Def.ActorFrame{
		LoadActor(THEME:GetPathB("","doors open"));
	};
end;

if Is2ndMIX() then
t[#t+1] = LoadActor(THEME:GetPathB("","Screen2ndMIXSelectMusic decorations/bnrframe.png"))..{
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-138);
	OnCommand=cmd(sleep,0.2;linear,0.1;diffusealpha,0);
};
t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(playcommand,'Set';CenterX;y,SCREEN_CENTER_Y-138;sleep,0.2;linear,0.1;diffusealpha,0);
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

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(zoom,1.5;CenterX;y,SCREEN_CENTER_Y+120;);
	OnCommand=cmd(sleep,0.2;linear,0.1;diffusealpha,0);
	LoadActor(THEME:GetPathG("","MusicWheelItem Song NormalPart/cd/cd_mask"))..{
		InitCommand=cmd(blend,Blend.NoEffect;zwrite,1;clearzbuffer,true;);
	};
	Def.Sprite{
		InitCommand=cmd(ztest,1);
		OnCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
			if song then
				local songtit = song:GetDisplayMainTitle();
				if CDImage[songtit] ~= nil then
					local diskImage = CDImage[songtit];
					self:Load(THEME:GetPathG("","MusicWheelItem Song NormalPart/cd/"..diskImage));
				else
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
		end;
	};
	LoadActor(THEME:GetPathG("", "MusicWheelItem Song NormalPart/cd/overlay"))..{
		OnCommand=cmd(playcommand,"Set");
		SetCommand=function(self,params)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				local songtit = song:GetDisplayMainTitle();
				if CDImage[songtit] ~= nil then
					self:visible(false)
				else
					self:visible(true)
				end;
			else
				self:visible(false)
			end;
		end;
	};
};
else
--song jacket--
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-20);
	Def.Quad{
		OnCommand=function(self)
			self:setsize(464,464);
			self:diffuse(color("0,0,0,1"));
			self:zoom(1);
			self:sleep(0.2)
			self:linear(0.05);
			self:zoomx(1.5);
			self:zoomy(0);
		end;
	};
	Def.Sprite {
		OnCommand=function (self)
			local course = GAMESTATE:GetCurrentCourse();
			if GAMESTATE:IsCourseMode() then
				if course:GetBackgroundPath() then
					self:Load(course:GetBackgroundPath())
					self:setsize(460,460);
				else
					self:Load(THEME:GetPathG("", "Common fallback jacket"));
					self:setsize(460,460);
				end;
			else
			local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:diffusealpha(1);
						self:LoadBackground(song:GetJacketPath());
						self:setsize(460,460);
					elseif song:HasBackground() then
						self:diffusealpha(1);
						self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
						self:setsize(460,460);
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:setsize(460,460);
					end;
				else
					self:diffusealpha(0);
			end;
			self:zoom(1);
			self:sleep(0.2)
			self:linear(0.05);
			self:zoomx(1.5);
			self:zoomy(0);
		end;
		end;
	};
};
end;

if Is2ndMIX() then
t[#t+1] = Def.Sprite{
  InitCommand=cmd(pause;y,SCREEN_CENTER_Y-244;x,SCREEN_CENTER_X+296;halign,1);
  OnCommand=cmd(playcommand,"Set";sleep,0.2;linear,0.1;diffusealpha,0);
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
  OnCommand=cmd(playcommand,"Set";sleep,0.2;linear,0.1;diffusealpha,0);
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
else
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(zoom,1;Center);
	Def.Sprite{
	OnCommand=function(self)
		if GAMESTATE:GetPlayMode() == 'PlayMode_Regular' or GAMESTATE:GetPlayMode() == 'PlayMode_Battle' or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			self:Load(THEME:GetPathG("_stages/ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ));
		elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
			self:Load(THEME:GetPathG("_stages/ScreenStageInformation", "Stage oni"));
		elseif GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
			self:Load(THEME:GetPathG("_stages/ScreenStageInformation", "Stage Nonstop"));
		elseif (GAMESTATE:Env()).EndlessState then
			self:Load(THEME:GetPathG("_stages/ScreenStageInformation", "Stage endless"));
		end;
		self:zoom(0.97);
		self:sleep(0.2)
		self:linear(0.05);
		self:zoomx(1.5);
		self:zoomy(0);
	end;
	};
};
end;
return t;
