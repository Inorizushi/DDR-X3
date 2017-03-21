local t = Def.ActorFrame{};

if not Is2ndMIX() then
t[#t+1] = LoadActor("normal");
end;

return t;
