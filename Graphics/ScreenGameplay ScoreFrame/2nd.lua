local t = Def.ActorFrame{};

if GAMESTATE:IsPlayerEnabled('PlayerNumber_P1') then
--P1 Score Frame
t[#t+1]=Def.ActorFrame{
	InitCommand=cmd(addy,-14);
	LoadActor("MIXScoreFrame")..{
		InitCommand=cmd(x,THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX"));
	};
};
end;

if GAMESTATE:IsPlayerEnabled('PlayerNumber_P2') then
t[#t+1]=Def.ActorFrame{
	InitCommand=cmd(addy,-14);
	LoadActor("MIXScoreFrame")..{
		InitCommand=cmd(x,THEME:GetMetric(Var "LoadingScreen","PlayerP2OnePlayerOneSideX"));
	};
};
end;

return t;
