local t = Def.ActorFrame {};

local Space = '000000000';

t[#t+1] = Def.ActorFrame{
  LoadActor("../2nd doors")..{
    InitCommand=cmd(setsize,1280,720;CenterY;CenterX);
  };
};

t[#t+1] = Def.ActorFrame {
	LoadActor( "DANCELEVEL" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-2;y,SCREEN_TOP+70;);
	}
};

--Frame
t[#t+1] = Def.ActorFrame {
	LoadActor( "frame" );
};

--Player stats
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
	--Statsp1
	t[#t+1] = LoadActor("statsP1")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-116;y,SCREEN_CENTER_Y-74)
	};
	--Song score p1
	t[#t+1] = LoadActor("normal")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-306;y,SCREEN_BOTTOM-142)
	};
	t[#t+1] = LoadActor("normal")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-306;y,SCREEN_BOTTOM-74)
	};
	t[#t+1]=Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X-312;y,SCREEN_BOTTOM-124;);
		LoadFont("2ndMIXStageEval")..{
			InitCommand=cmd(playcommand,"Set");
			SetCommand = function(self)
				self:settext("oooooooooo");
			end;
		};
		Def.RollingNumbers {
			File = THEME:GetPathF("","2ndMIXStageEval");
			InitCommand=cmd(playcommand,"Set");
			SetCommand = function (self)
				local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore()
				self:Load("RollingNumbers2ndEvalStage");
				self:targetnumber(score);
			end;
		};
	};
	--Total score p1
	t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X-304;y,SCREEN_BOTTOM-56;);
		LoadFont("2ndMIXScoreEval")..{
			InitCommand=cmd(playcommand,"Set");
			SetCommand = function(self)
				self:settext("ooooooooo");
			end;
		};
		Def.RollingNumbers {
			File = THEME:GetPathF("","2ndMIXScoreEval");
			InitCommand=cmd(playcommand,"Set");
			SetCommand = function (self)
				local score = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):GetScore();
				self:Load("RollingNumbers2ndEval");
				self:targetnumber(score);
			end;
		};
	};
end

if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
	--Statsp2
	t[#t+1] = LoadActor("statsP2")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+48;y,SCREEN_CENTER_Y-64)
	};
	--Song score p2
	t[#t+1] = LoadActor("normal")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+306;y,SCREEN_BOTTOM-142)
	};
	t[#t+1] = LoadActor("normal")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+306;y,SCREEN_BOTTOM-74)
	};
	t[#t+1]=Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X+312;y,SCREEN_BOTTOM-124;);
		LoadFont("2ndMIXStageEval")..{
			InitCommand=cmd(playcommand,"Set");
			SetCommand = function(self)
				self:settext("oooooooooo");
			end;
		};
		Def.RollingNumbers {
			File = THEME:GetPathF("","2ndMIXStageEval");
			InitCommand=cmd(playcommand,"Set");
			SetCommand = function (self)
				local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetScore()
				self:Load("RollingNumbers2ndEvalStage");
				self:targetnumber(score);
			end;
		};
	};
	--Total score p2
	t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X+304;y,SCREEN_BOTTOM-56;);
		LoadFont("2ndMIXScoreEval")..{
			InitCommand=cmd(playcommand,"Set");
			SetCommand = function(self)
				self:settext("ooooooooo");
			end;
		};
		Def.RollingNumbers {
			File = THEME:GetPathF("","2ndMIXScoreEval");
			InitCommand=cmd(playcommand,"Set");
			SetCommand = function (self)
				local score = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_2):GetScore();
				self:Load("RollingNumbers2ndEval");
				self:targetnumber(score);
			end;
		};
	};
end

if GAMESTATE:IsCourseMode() then
	--Course Name
	t[#t+1] = LoadFont("ScreenSystemLayer credits normal") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+68;maxwidth,SCREEN_WIDTH;playcommand,"Set");
		SetCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse();
			if course then
				if GroupNameChange then
					self:settext(ChangeGroupName(course:GetDisplayFullTitle()));
				else
					self:settext(course:GetDisplayFullTitle());
				end;
			end;
		end;
		OffCommand=cmd();
	};
end

--Grade
t[#t+1] = LoadActor("grade")..{
	OffCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
};

return t
