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
			MESSAGEMAN:Broadcast("ModeDiffChange", {Difficulty=NewDiff})
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
	LoadActor("1P")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X-420,SCREEN_CENTER_Y+114;visible,false);
		OnCommand=function(s) if GAMESTATE:IsPlayerEnabled(PLAYER_1) then s:visible(true) else s:visible(false) end; end;
	};
};

t[#t+1] = Def.ActorFrame{
	LoadActor("basic placeholder");
	LoadActor("basic window")..{
		InitCommand = function(s) s:y(16):x(96):halign(1) end;
	};
	LoadActor("knob base")..{
		InitCommand = function(s) s:x(84):y(-20) end;
	};
	LoadActor("knob needle")..{
		Name = "Needle";
		InitCommand = function(s) s:valign(1):x(96):y(-12) end;
	};
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+220)
};




--Sound Handling
t[#t+1] = LoadActor("back")..{
	MenuLeftP1MessageCommand=cmd(play);
	MenuLeftP2MessageCommand=cmd(play);
	CodeMessageCommand=function(self, params)
		local codeName = params.Name
		if codeName == "Easier" then
			self:play()
		end
	end;
};

t[#t+1] = LoadActor("forward")..{
	MenuRightP1MessageCommand=cmd(play);
	MenuRightP2MessageCommand=cmd(play);
	CodeMessageCommand=function(self, params)
		local codeName = params.Name
		if codeName == "Harder" then
			self:play()
		end
	end;
};

return t
