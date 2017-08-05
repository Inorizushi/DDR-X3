local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("../2nd doors.png")..{
    InitCommand=cmd(Center);
  };
LoadActor("base")..{
    InitCommand=cmd(Center);
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor("DANCELEVEL")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-2,SCREEN_TOP+70);
  };
};

t[#t+1] = LoadActor("grade")..{
	OffCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
};

--Player stats
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
	--Statsp1
	t[#t+1] = LoadActor("statsP1")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-72;y,SCREEN_CENTER_Y-64)
	};
	--Song score p1
	t[#t+1] = Def.RollingNumbers {
		File = THEME:GetPathF("ScoreDisplayNormal", "Text");
		InitCommand=cmd(x,SCREEN_CENTER_X-204;y,SCREEN_CENTER_Y+217;playcommand,"Set");
		SetCommand = function (self)
			local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore();
			self:Load("RollingNumbersEvaluation");
			self:targetnumber(score);
			self:sleep(1);
			self:linear(1);
			self:addy(-30);
		end;
	};
	--Total score p1
	t[#t+1] = Def.RollingNumbers {
		File = THEME:GetPathF("ScoreDisplayTotal", "Text");
		InitCommand=cmd(x,SCREEN_CENTER_X-204;y,SCREEN_CENTER_Y+257;playcommand,"Set");
		SetCommand = function (self)
			local score = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):GetScore();
			self:Load("RollingNumbersEvaluation");
			self:targetnumber(score);
			self:sleep(1);
			self:linear(1);
			self:addy(-40);
		end;
	};
end

if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
	--Statsp2
	t[#t+1] = LoadActor("statsP2")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+48;y,SCREEN_CENTER_Y-64)
	};
	--Song score p1
	t[#t+1] = Def.RollingNumbers {
		File = THEME:GetPathF("ScoreDisplayNormal", "Text");
		InitCommand=cmd(x,SCREEN_CENTER_X+204;y,SCREEN_CENTER_Y+217;playcommand,"Set");
		SetCommand = function (self)
			local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetScore();
			self:Load("RollingNumbersEvaluation");
			self:targetnumber(score);
			self:sleep(1);
			self:linear(1);
			self:addy(-30);
		end;
	};
	--Total score p1
	t[#t+1] = Def.RollingNumbers {
		File = THEME:GetPathF("ScoreDisplayTotal", "Text");
		InitCommand=cmd(x,SCREEN_CENTER_X+204;y,SCREEN_CENTER_Y+257;playcommand,"Set");
		SetCommand = function (self)
			local score = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_2):GetScore();
			self:Load("RollingNumbersEvaluation");
			self:targetnumber(score);
			self:sleep(1);
			self:linear(1);
			self:addy(-40);
		end;
	};
end

return t;
