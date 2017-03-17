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

if not GAMESTATE:IsCourseMode() then
--song jacket--
t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(playcommand,'Set';CenterX;y,SCREEN_CENTER_Y-130;zoomy,0;sleep,0.099;sleep,0.396;linear,0.2;zoomy,1);
	Def.Sprite {
		SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
			if song:HasBanner() then
				self:LoadFromSongBanner(GAMESTATE:GetCurrentSong());
				self:setsize(256,80);
			else
				self:Load(THEME:GetPathG("","Common fallback banner"));
				self:setsize(256,80);
			end;
		end;
	};
};
else
t[#t+1] = LoadActor("CourseDisplay");
end;

t[#t+1] = LoadActor("StageDisplay");

--No mods for you ecksdee
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = Def.Actor{
		OnCommand=function(self)
			GAMESTATE:ApplyStageModifiers(pn,"1x,noholds")
		end;
	};
end;

return t
