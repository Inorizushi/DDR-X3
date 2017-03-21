local t = Def.ActorFrame{};
local screenName = Var "LoadingScreen"

if Is2ndMIX() then
  t[#t+1] = Def.ActorFrame{
    LoadActor("2nd");
  };
else
  t[#t+1] = Def.ActorFrame{
    LoadActor("X3");
  };
end;

return t
