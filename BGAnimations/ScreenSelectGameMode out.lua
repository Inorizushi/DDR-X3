local t = Def.ActorFrame{};

local env = GAMESTATE:Env();
local OLDMIX = env.OLDMIX == true;

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen);
		OnCommand=cmd(diffusealpha,0;sleep,0.75);
	};
	LoadActor(THEME:GetPathS("","_swoosh out.ogg"))..{
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play)
	};
}
if OLDMIX then
t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathB("","_2ndDoorsclose"));
}
end;

return t;
