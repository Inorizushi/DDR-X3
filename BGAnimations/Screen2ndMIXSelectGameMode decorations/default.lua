local t= Def.ActorFrame{};

local AcceptableDifficulties =
{
	'Difficulty_Easy', 'Difficulty_Medium', 'Difficulty_Hard'
}
local DiffToIndex = {}
for k, v in pairs(AcceptableDifficulties) do
	DiffToIndex[v] = k
end

t[#t+1] = Def.Actor{
	OnCommand=function(self)
		if GAMESTATE:GetNumPlayersEnabled() == 1 then
			GAMESTATE:SetCurrentStyle("single");
		elseif GAMESTATE:GetNumPlayersEnabled() == 2 then
			GAMESTATE:SetCurrentStyle("versus");
		end;
	end;
	CodeMessageCommand=function(self, params)
		local CurDiffIdx = DiffToIndex[
			GAMESTATE:GetPreferredDifficulty(GAMESTATE:GetMasterPlayerNumber())]
		local NewDiffIdx
		local codeName = params.Name
		if codeName == "Easier" then
			NewDiffIdx = CurDiffIdx - 1
		elseif codeName == "Harder" then
			NewDiffIdx = CurDiffIdx + 1
		else
			return
		end
		NewDiffIdx = clamp(NewDiffIdx, 1, #AcceptableDifficulties)
		if NewDiffIdx ~= CurDiffIdx then
			local NewDiff = AcceptableDifficulties[NewDiffIdx]
			GAMESTATE:ApplyGameCommand("difficulty,"..ToEnumShortString(NewDiff))
			MESSAGEMAN:Broadcast("ModeDiffChange", {Difficulty=NewDiff, Harder=(codeName == "Harder")})
		end
	end;
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+30);
	Def.Sprite{
		EASYMessageCommand=function(s) s:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/easytext")) end,
		NORMMessageCommand=function(s) s:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/normtext")) end,
		HARDMessageCommand=function(s) s:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/hardtext")) end,
	};
};

t[#t+1] = Def.ActorFrame{
	--LoadActor("another.png");
	Def.Sprite{
		Texture="basic window";
		InitCommand = function(s) s:y(16):x(96):halign(1) end;
		ModeDiffChangeMessageCommand=function(self, param)
			local Diff = param.Difficulty;
			if Diff == 'Difficulty_Easy' then
				self:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/basic window"))
			elseif Diff == 'Difficulty_Medium' then
				self:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/another window"))
			elseif Diff == 'Difficulty_Hard' then
				self:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/another window"))
			end;
		end;
	};
	Def.Sprite{
		Texture="top focused backer";
		InitCommand = function(s) s:x(246):y(-58) end;
		ModeDiffChangeMessageCommand=function(self, param)
			local Diff = param.Difficulty;
			if Diff == 'Difficulty_Easy' then
				self:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/top focused backer"))
			elseif Diff == 'Difficulty_Medium' or Diff == 'Difficulty_Hard' then
				self:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/top unfocused backer"))
			end;
		end;
	};
	Def.Sprite{
		Texture="bottom unfocused backer";
		InitCommand = function(s) s:x(246):y(20) end;
		ModeDiffChangeMessageCommand=function(self, param)
			local Diff = param.Difficulty;
			if Diff == 'Difficulty_Easy' then
				self:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/bottom unfocused backer"))
			elseif Diff == 'Difficulty_Medium' or Diff == 'Difficulty_Hard' then
				self:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/bottom focused backer"))
			end;
		end;
	};
	Def.Sprite{
		Texture="basic text";
		InitCommand = function(s) s:x(256):y(-58) end;
		ModeDiffChangeMessageCommand=function(self, param)
			local Diff = param.Difficulty;
			if Diff == 'Difficulty_Easy' then
				self:diffuse(color("1,1,1,1"));
			elseif Diff == 'Difficulty_Medium' or Diff == 'Difficulty_Hard' then
				self:diffuse(color("0.42,0.42,0.42,1"));
			end;
		end;
	};
	Def.Sprite{
		Texture="another text";
		InitCommand = function(s) s:x(256):y(20):diffuse(color("0.42,0.42,0.42,1")) end;
		ModeDiffChangeMessageCommand=function(self, param)
			local Diff = param.Difficulty;
			if Diff == 'Difficulty_Easy' then
				self:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/another text")):diffuse(color("0.42,0.42,0.42,1"));
			elseif Diff == 'Difficulty_Medium' then
				self:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/another text")):diffuse(color("1,1,1,1"));
			elseif Diff == 'Difficulty_Hard' then
				self:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/maniac text")):diffuse(color("1,1,1,1"));
			end;
		end;
	};
	LoadActor("knob base")..{
		InitCommand = function(s) s:x(84):y(-20) end;
	};
	LoadActor("knob needle")..{
		Name = "Needle";
		InitCommand = function(s) s:valign(1):x(108):y(-8) end;
		ModeDiffChangeMessageCommand=function(self, param)
			local Diff = param.Difficulty;
			if Diff == 'Difficulty_Easy' then
				self:linear(0.2):x(108):y(-6):rotationz(0);
			elseif Diff == 'Difficulty_Medium' or Diff == 'Difficulty_Hard' then
				self:linear(0.2):x(86):y(6):rotationz(60);
			end;
		end;
	};
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+220)
};




--Sound Handling
t[#t+1] = LoadActor("back")..{
	MenuLeftP1MessageCommand=cmd(play);
	MenuLeftP2MessageCommand=cmd(play);
	ModeDiffChangeMessageCommand=function(self, params)
		if not params.Harder then
			self:play()
		end
	end;
};

t[#t+1] = LoadActor("forward")..{
	MenuRightP1MessageCommand=cmd(play);
	MenuRightP2MessageCommand=cmd(play);
	ModeDiffChangeMessageCommand=function(self, params)
		if params.Harder then
			self:play()
		end
	end;
};

return t
