local xPosPlayer = {
    P1 = (THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX")),
    P2 = (THEME:GetMetric(Var "LoadingScreen","PlayerP2OnePlayerOneSideX"))
}

local t = Def.ActorFrame{}
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("MIX.png")..{
		Name = pn,
		InitCommand=function(self)
			local short = ToEnumShortString(pn)
			self:x(xPosPlayer[short])
		end,
		OnCommand=function(s) s:zoomx(pn=='PlayerNumber_P2' and -1 or 1) end,
	};
end;


return t
