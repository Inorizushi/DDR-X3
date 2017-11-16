local t = Def.ActorFrame {};

local Space = '0000';
local Combo = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo();

local FullStep = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W1") + STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W2") + STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W3") + STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W4") + STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W5") + STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_Miss")
local Marvelous = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W1"), -4);
local Perfect = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W1")+STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W2"), -4);
local Great = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W3"), -4);
local Good = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W4"), -4);
local Almost = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W5"), -4);
local Boo = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_Miss"), -4);
local PMarv = Marvelous/FullStep
local PPerf = Perfect/FullStep;
local PGrea = Great/FullStep;
local PGood = Good/FullStep;
local PAlmo = Almost/FullStep;
local PBoo = Boo/FullStep;

--Perfect--
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(player,PLAYER_1;y,-100);
	LoadFont("2ndMIXJudgeNum.ini")..{
		InitCommand=cmd(horizalign,right;);
		OnCommand=function(self)
			self:settextf(Perfect);
		end;
	};
	LoadFont("2ndMIXJudgePercent")..{
		InitCommand=cmd(addx,-134;addy,8;horizalign,right;);
		OnCommand=function(self)
			self:settextf(string.format("%.1f", (Perfect*100)/FullStep).."%%");
		end;
	};
};

--Great--
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(player,PLAYER_1;y,-54);
	LoadFont("2ndMIXJudgeNum.ini")..{
		InitCommand=cmd(horizalign,right;);
		OnCommand=function(self)
			self:settextf(Great);
		end;
	};
	LoadFont("2ndMIXJudgePercent")..{
		InitCommand=cmd(addx,-134;addy,8;horizalign,right;);
		OnCommand=function(self)
			self:settextf(string.format("%.1f", (Great*100)/FullStep).."%%");
		end;
	};
};

--Good--
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(player,PLAYER_1;y,-10);
	LoadFont("2ndMIXJudgeNum.ini")..{
		InitCommand=cmd(horizalign,right;);
		OnCommand=function(self)
			self:settextf(Good);
		end;
	};
	LoadFont("2ndMIXJudgePercent")..{
		InitCommand=cmd(addx,-134;addy,8;horizalign,right;);
		OnCommand=function(self)
			self:settextf(string.format("%.1f", (Good*100)/FullStep).."%%");
		end;
	};
};

--Boo--
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(player,PLAYER_1;y,36);
	LoadFont("2ndMIXJudgeNum.ini")..{
		InitCommand=cmd(horizalign,right;);
		OnCommand=function(self)
			self:settextf(Almost);
		end;
	};
	LoadFont("2ndMIXJudgePercent")..{
		InitCommand=cmd(addx,-134;addy,8;horizalign,right;);
		OnCommand=function(self)
			self:settextf(string.format("%.1f", (Almost*100)/FullStep).."%%");
		end;
	};
};

--Miss--
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(player,PLAYER_1;y,82);
	LoadFont("2ndMIXJudgeNum.ini")..{
		InitCommand=cmd(horizalign,right;);
		OnCommand=function(self)
			self:settextf(Boo);
		end;
	};
	LoadFont("2ndMIXJudgePercent")..{
		InitCommand=cmd(addx,-134;addy,8;horizalign,right;);
		OnCommand=function(self)
			self:settextf(string.format("%.1f", (Boo*100)/FullStep).."%%");
		end;
	};
};
--Max Combo--
t[#t+1] = LoadFont("2ndMIXMaxComboNum")..{
	InitCommand=cmd(player,PLAYER_1;x,-12;y,132;horizalign,right;);
	OnCommand=function(self)
		self:settextf(Combo);
	end;
};
--Bar indicators

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,-328;addy,-2;zoomto,24,299;);
--Miss
	Def.Quad{
		OnCommand=cmd(diffusecolor,color("#F04000");cropbottom,1;draworder,1;linear,1;cropbottom,1-(PBoo+PAlmo+PGood+PGrea+PPerf+PMarv));
	};
--Boo
	Def.Quad{
		OnCommand=cmd(diffusecolor,color("#F800B0");cropbottom,1;draworder,1;linear,1;cropbottom,1-(PAlmo+PGood+PGrea+PPerf+PMarv));
	};
--Good
	Def.Quad{
		OnCommand=cmd(diffusecolor,color("#10E0F0");cropbottom,1;draworder,1;linear,1;cropbottom,1-(PGood+PGrea+PPerf+PMarv));
	};
--Great
	Def.Quad{
		OnCommand=cmd(diffusecolor,color("#00F860");cropbottom,1;draworder,1;linear,1;cropbottom,1-(PGrea+PPerf+PMarv));
	};
--Perfect
	Def.Quad{
		OnCommand=cmd(diffusecolor,color("#F8F840");cropbottom,1;draworder,1;linear,1;cropbottom,1-(PPerf+PMarv));
	};
--Marvelous
	Def.Quad{
		OnCommand=cmd(diffusecolor,color("#F8F840");cropbottom,1;draworder,1;linear,1;cropbottom,1-(PMarv));
	};
};

return t;
