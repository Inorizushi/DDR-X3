local t = Def.ActorFrame{};

if not Is2ndMIX() then
-- Full combo
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("FullCombo", pn) .. {
	};
end;
end;

return t;
